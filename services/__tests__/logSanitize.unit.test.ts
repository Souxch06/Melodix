/**
 * M-7 — sanitizeErrorForLog : aucune URL de flux (signée) ne transite en
 * clair dans les journaux, l'erreur d'origine n'est jamais mutée.
 */
import { sanitizeErrorForLog } from '../logSanitize';

describe('sanitizeErrorForLog (M-7)', () => {
  it('masque TOUTE URL http(s) du message, identité intacte', () => {
    const signed =
      'Player error for content https://cdn.example.com/audio.mp3?token=SECRET_SIG&expires=9 load failed';
    const result = sanitizeErrorForLog(new Error(signed)) as Error & {
      message: string;
    };

    expect(result).toBeInstanceOf(Error);
    expect(result.message).not.toContain('https://');
    expect(result.message).not.toContain('SECRET_SIG');
    expect(result.message).toContain('<url>');
    expect(result.message).toContain('load failed');
  });

  it('plusieurs URLs → toutes masquées', () => {
    const result = sanitizeErrorForLog(
      'GET https://a.example/x?sig=1 → redirect https://b.example/y?sig=2'
    ) as string;

    expect(result).toBe('GET <url> → redirect <url>');
  });

  it('erreur SANS URL : retournée TELLE QUELLE (même référence)', () => {
    const plain = new Error('boom');
    expect(sanitizeErrorForLog(plain)).toBe(plain);
  });

  it('l erreur d ORIGINE n est JAMAIS mutée (elle remonte à l appelant)', () => {
    const error = new Error('GET https://a.example/x?sig=9 failed');
    sanitizeErrorForLog(error);
    expect(error.message).toContain('https://a.example/x?sig=9');
  });

  it('valeurs non-Error (objet, null, nombre) : pass-through', () => {
    expect(sanitizeErrorForLog(null)).toBeNull();
    expect(sanitizeErrorForLog(42)).toBe(42);
    const obj = { weird: true };
    expect(sanitizeErrorForLog(obj)).toBe(obj);
  });
});
