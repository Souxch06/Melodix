module.exports = {
  preset: 'jest-expo',
  testEnvironment: 'jsdom',
  setupFilesAfterEnv: ['@testing-library/jest-native/extend-expect'],
  moduleFileExtensions: ['ts', 'tsx', 'js', 'jsx', 'json', 'node'],
  testPathIgnorePatterns: ['/node_modules/', '/android/', '/ios/'],
  testMatch: ['**/__tests__/**/*.unit.test.ts?(x)'],
  transformIgnorePatterns: [
    'node_modules/(?!(jest-)?@react-native|react-native|@expo|@expo-module|expo|@react-navigation|@unimodules|@expo/vector-icons|expo-modules-core|@testing-library|@shopify/react-native-skia)',
  ],
  moduleNameMapper: {
    '\\.(css|less|scss|sass)$': 'identity-obj-proxy',
    '\\.(png|jpg|jpeg|gif|svg)$': 'jest-transform-stub',
    // Stockage local factice pour les suites (pas de module natif en test).
    '^@react-native-async-storage/async-storage$':
      '@react-native-async-storage/async-storage/jest/async-storage-mock',
    '^@config$': '<rootDir>/config/index.ts',
    '^@api$': '<rootDir>/api/index.ts',
    '^@models$': '<rootDir>/models/index.ts',
    '^@utils$': '<rootDir>/utils/index.ts',
    '^@data$': '<rootDir>/data/index.ts',
    '^@services$': '<rootDir>/services/index.ts',
    '^@context$': '<rootDir>/context/index.ts',
    '^@hooks$': '<rootDir>/hooks/index.ts',
    '^@assets/(.*)$': '<rootDir>/assets/$1',
  },
};
