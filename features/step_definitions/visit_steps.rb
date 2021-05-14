# frozen_string_literal: true

When 'the landing page is shown' do
  visit root_path
end

When 'the sign in page is shown' do
  visit new_user_session_path
end

When 'the join page is shown' do
  visit new_user_registration_path
end

When 'the admin users page is shown' do
  visit admin_users_path
end
