# frozen_string_literal: true

# rubocop:disable Rails/SkipsModelValidations
class RenamePeopleToProfiles < ActiveRecord::Migration[6.1]
  def up
    rename_table :people, :profiles

    PaperTrail::Version.where(item_type: 'Person').update_all(item_type: 'Profile')
  end

  def down
    rename_table :profiles, :people

    PaperTrail::Version.where(item_type: 'Profile').update_all(item_type: 'Person')
  end
end
# rubocop:enable Rails/SkipsModelValidations
