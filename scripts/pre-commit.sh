#!/bin/sh

echo Run RuboCop
bin/rubocop

echo Run ERB Lint
bin/erblint app/views

echo Run eslint
yarn run eslint app/frontend config/webpack

echo Run stylelint
yarn run stylelint "app/frontend/stylesheets/**/*.scss"

echo Run gherkin-lint
yarn run gherkin-lint features

echo Run Brakeman
bin/brakeman

echo Run specs
bin/rspec spec

echo Run features
bin/cucumber features