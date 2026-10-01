import assert from 'node:assert/strict';
import test from 'node:test';

import { HttpClientError, httpGet } from '../httpClient';

type FetchStubCall = { url: string | URL | Request };

const withFetchStub = async (
  stub: (call: FetchStubCall) => Promise<Response>,
  run: () => Promise<void>
): Promise<void> => {
  const original = globalThis.fetch;
  globalThis.fetch = ((url: string | URL | Request) =>
    stub({ url })) as typeof fetch; // injection de test
  try {
    await run();
  } finally {
    globalThis.fetch = original;
  }
};

const jsonResponse = (
  status: number,
  body: unknown,
  headers: Record<string, string> = {}
) =>
  new Response(JSON.stringify(body), {
    status,
    headers: { 'content-type': 'application/json', ...headers },
  });

test('GET JSON 200 → parse', async () => {
  await withFetchStub(
    async () => jsonResponse(200, { ok: true }),
    async () => {
      const data = await httpGet<{ ok: boolean }>('https://x.test/a');
      assert.deepEqual(data, { ok: true });
    }
  );
});

test('400 n est PAS retenté', async () => {
  let calls = 0;
  await withFetchStub(
    async () => {
      calls += 1;
      return jsonResponse(400, { reason: 'bad' });
    },
    async () => {
      await assert.rejects(
        httpGet('https://x.test/a', { retries: 3 }),
        (error: unknown) => {
          assert.ok(error instanceof HttpClientError);
          assert.equal(error.status, 400);
          return true;
        }
      );
      assert.equal(calls, 1);
    }
  );
});

test('429 est retenté et Retry-After est honoré dans l erreur', async () => {
  let calls = 0;
  await withFetchStub(
    async () => {
      calls += 1;
      return jsonResponse(429, { reason: 'slow down' }, { 'retry-after': '0' });
    },
    async () => {
      await assert.rejects(
        httpGet('https://x.test/a', { retries: 1 }),
        (error: unknown) => {
          assert.ok(error instanceof HttpClientError);
          assert.equal(error.status, 429);
          assert.equal(error.retryAfterSeconds, 0);
          return true;
        }
      );
      assert.equal(calls, 2); // 1 tentative + 1 retry
    }
  );
});

test('5xx : retry puis succès', async () => {
  let calls = 0;
  await withFetchStub(
    async () => {
      calls += 1;
      return calls === 1
        ? jsonResponse(502, {})
        : jsonResponse(200, { ok: true });
    },
    async () => {
      const data = await httpGet<{ ok: boolean }>('https://x.test/a', {
        retries: 2,
      });
      assert.deepEqual(data, { ok: true });
      assert.equal(calls, 2);
    }
  );
});

test('erreur réseau : retry puis abandon', async () => {
  let calls = 0;
  await withFetchStub(
    async () => {
      calls += 1;
      throw new TypeError('fetch failed');
    },
    async () => {
      await assert.rejects(
        httpGet('https://x.test/a', { retries: 2 }),
        TypeError
      );
      assert.equal(calls, 3);
    }
  );
});

test('le corps d erreur est borné (snippet)', async () => {
  const huge = 'x'.repeat(5000);
  await withFetchStub(
    async () =>
      new Response(huge, {
        status: 500,
        headers: { 'content-type': 'text/plain' },
      }),
    async () => {
      await assert.rejects(
        httpGet('https://x.test/a', { retries: 0 }),
        (error: unknown) => {
          assert.ok(error instanceof HttpClientError);
          assert.ok(
            (error.bodySnippet ?? '').length <= 401,
            `snippet trop long: ${(error.bodySnippet ?? '').length}`
          );
          return true;
        }
      );
    }
  );
});
