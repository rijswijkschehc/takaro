# frozen_string_literal: true

SimpleCov.start 'rails' do
  add_group 'Conductors', 'app/conductors'
  add_group 'Decorators', 'app/decorators'
  add_group 'Forms', 'app/forms'
  add_group 'Policies', 'app/policies'
  add_group 'Presentation', 'app/presentation'
  add_group 'Services', 'app/services'
end
