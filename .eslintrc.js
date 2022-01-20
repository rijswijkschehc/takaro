module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: [
    'airbnb-base',
  ],
  parser: '@typescript-eslint/parser',
  parserOptions: {
    ecmaVersion: 12,
    sourceType: 'module',
  },
  plugins: [
    '@typescript-eslint',
  ],
  root: true,
  rules: {
    'class-methods-use-this': 0,
    'import/extensions': [
      'error',
      'ignorePackages',
      {
        js: 'never',
        ts: 'never',
      },
    ],
    'max-len': ['warn', { code: 120 }],
    'lines-between-class-members': [1, 'always', { exceptAfterSingleLine: true }],
  },
  settings: {
    'import/resolver': {
      node: {
        paths: ['./app/frontend'],
        extensions: ['.js', '.jsx', '.ts', '.tsx'],
      },
    },
  },
};
