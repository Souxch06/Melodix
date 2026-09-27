import { isAuthCallbackUrl } from '../isAuthCallbackUrl';
import { redirectSystemPath } from '../../../app/+native-intent';

describe('isAuthCallbackUrl', () => {
  it('recognises the Spotify sign-in callback', () => {
    expect(isAuthCallbackUrl('melodix://callback?code=abc&state=xyz')).toBe(
      true
    );
    expect(isAuthCallbackUrl('melodix:///callback?error=access_denied')).toBe(
      true
    );
    expect(isAuthCallbackUrl('melodix://callback')).toBe(true);
    expect(
      isAuthCallbackUrl('exp://192.168.1.20:8081/--/callback?code=abc')
    ).toBe(true);
  });

  it('leaves the other links to the router', () => {
    expect(isAuthCallbackUrl('melodix://')).toBe(false);
    expect(isAuthCallbackUrl('melodix:///home')).toBe(false);
    expect(isAuthCallbackUrl('melodix://callbacks')).toBe(false);
    expect(isAuthCallbackUrl('melodix://home/album/callback')).toBe(false);
    expect(isAuthCallbackUrl('exp://192.168.1.20:8081/--/')).toBe(false);
    expect(isAuthCallbackUrl(null)).toBe(false);
  });
});

describe('redirectSystemPath (+native-intent)', () => {
  it('hides the sign-in callback from the router', () => {
    expect(
      redirectSystemPath({
        path: 'melodix://callback?code=abc',
        initial: false,
      })
    ).toBeNull();
    expect(
      redirectSystemPath({ path: 'melodix://callback?code=abc', initial: true })
    ).toBeNull();
  });

  it('keeps every other link', () => {
    expect(redirectSystemPath({ path: 'melodix:///', initial: true })).toBe(
      'melodix:///'
    );
    expect(
      redirectSystemPath({ path: 'melodix:///home/album/42', initial: false })
    ).toBe('melodix:///home/album/42');
  });
});
