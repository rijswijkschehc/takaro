module.exports = {
  env: {
    browser: true,
    es2021: true,
  },
  extends: [
    'airbnb-base',
  ],
  parser: '@babel/eslint-parser',
  parserOptions: {
    ecmaVersion: 12,
    sourceType: 'module',
  },
  rules: {
    'max-len': ['warn', { code: 120 }],
  },
  settings: {
    'import/resolver': {
      node: {
        paths: ['./app/frontend'],
      },
    },
  },
};
