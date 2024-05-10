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
    'import/resolver': {
      webpack: {
        extensions: ['.js', '.jsx', '.ts', '.tsx']
      }
    },
    react: { version: '17' }
  },
};
