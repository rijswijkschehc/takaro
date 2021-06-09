// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs';
import * as ActiveStorage from '@rails/activestorage';
import 'trix';
import '@rails/actiontext';
import 'channels';
import 'controllers';
import '@fortawesome/fontawesome-free/js/all';

import '../stylesheets/application.scss';

import('src/plugins');

require.context('../images', true);

Rails.start();
ActiveStorage.start();
