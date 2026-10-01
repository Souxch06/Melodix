/**
 * Mock Jest d'expo-secure-store : stockage mémoire volatil.
 * Convention Jest officielle (__mocks__ à la racine) : aucun jest.mock()
 * explicite n'est requis dans les suites.
 */
const vault = new Map<string, string>();

export const getItemAsync = async (key: string): Promise<string | null> =>
  vault.has(key) ? (vault.get(key) as string) : null;

export const setItemAsync = async (
  key: string,
  value: string
): Promise<void> => {
  vault.set(key, value);
};

export const deleteItemAsync = async (key: string): Promise<void> => {
  vault.delete(key);
};

export const isAvailableAsync = async (): Promise<boolean> => true;

/** Tests uniquement : vide le coffre simulé. */
export const __clearSecureStoreMock = (): void => {
  vault.clear();
};
