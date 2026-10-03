import { createHmac } from 'node:crypto';
import assert from 'node:assert/strict';
import test from 'node:test';

import { generateTotp } from '../accessToken';

/**
 * Vecteur calculé de façon indépendante via RFC 6238-style HMAC-SHA1 :
 * - secret transformé = xor des codes ((index % 33) + 9), joint
 * - compteur = floor(serverTime / 30) sur 8 octets BE
 * - troncature dynamique modulo 10^6
 */
const expectedTotp = (serverTime: number, secret: string): string => {
  const transformed = Array.from(
    secret,
    (c, i) => c.charCodeAt(0) ^ ((i % 33) + 9)
  ).join('');
  const key = Buffer.from(transformed, 'utf8');
  const counter = Buffer.alloc(8);
  counter.writeBigUInt64BE(BigInt(Math.floor(serverTime / 30)));
  const digest = createHmac('sha1', key).update(counter).digest();
  const offset = digest[digest.length - 1] & 0xf;
  const code =
    ((digest[offset] & 0x7f) << 24) |
    ((digest[offset + 1] & 0xff) << 16) |
    ((digest[offset + 2] & 0xff) << 8) |
    (digest[offset + 3] & 0xff);
  return (code % 1_000_000).toString().padStart(6, '0');
};

test('generateTotp = référence indépendante', () => {
  const cases: [number, string][] = [
    [1_700_000_000, 'abcdef123456'],
    [1_700_000_029, 'xyz'],
    [1_700_000_030, 'abcdef123456'],
    [59, 's3cr3t'],
    [0, 's3cr3t'],
  ];
  for (const [time, secret] of cases) {
    assert.equal(
      generateTotp(time, secret),
      expectedTotp(time, secret),
      `t=${time}`
    );
  }
});

test('generateTotp change à la frontière de fenêtre 30 s', () => {
  const secret = 'static-secret';
  const inWindow = generateTotp(90, secret);
  const nextWindow = generateTotp(120, secret);
  assert.notEqual(inWindow, nextWindow);
});

test('generateTotp toujours 6 chiffres', () => {
  for (let t = 0; t < 300; t += 17) {
    const code = generateTotp(t * 30, 'testsecret');
    assert.match(code, /^\d{6}$/);
  }
});
