// Signe un APK (v1+v2+v3) avec une paire clé/cert PEM extraite du keystore persistant.
// Usage: node apk_sign.js <in.apk> <all.pem> <out.apk>  — le PEM ne quitte jamais la machine.
const { readFileSync, writeFileSync } = require('fs');
const { ApkSigner, SigningKey } = require('/home/user/apktools/node_modules/apk_sign_ts');
(async () => {
  const [,, inApk, pemFile, outApk] = process.argv;
  const pem = readFileSync(pemFile, 'utf8');
  const key = pem.match(/-----BEGIN PRIVATE KEY-----[\s\S]*?-----END PRIVATE KEY-----/)[0];
  const cert = pem.match(/-----BEGIN CERTIFICATE-----[\s\S]*?-----END CERTIFICATE-----/)[0];
  const signer = new ApkSigner({ signingKey: SigningKey.fromPEM(key, cert) });
  const { signedApk } = await signer.sign(new Uint8Array(readFileSync(inApk)));
  writeFileSync(outApk, signedApk);
  console.log('signed:', outApk, signedApk.length, 'bytes');
})().catch((e) => { console.error(e); process.exit(1); });
