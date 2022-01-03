# frozen_string_literal: true

When 'the user comments with {string}' do |comment|
  find('.comment_content trix-editor').set(comment)
  click_on('Create Comment')
end
