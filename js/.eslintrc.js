module.exports = {
  env: {
    browser: true,
    es2021: true,
    jest: {
      globals: true,
    },
  },
  extends: [
    'plugin:react/recommended',
    'airbnb',
  ],
  parserOptions: {
    ecmaFeatures: {
      jsx: true,
    },
    ecmaVersion: 12,
    sourceType: 'module',
  },
  plugins: [
    'react',
  ],
  rules: {},
  settings: {
    'import/resolver': 'webpack',
    react: { version: '17' }
  },
};
