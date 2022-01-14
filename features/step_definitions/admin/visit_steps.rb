# frozen_string_literal: true

When 'the admin users page is shown' do
  visit admin_users_path
end

When 'the admin equipment locations page is shown' do
  visit admin_equipment_locations_path
end

When 'the new admin equipment location page is shown' do
  visit new_admin_equipment_location_path
end

When 'the admin equipment locations page for {location} is shown' do |location|
  visit admin_equipment_location_path(location)
end
