# frozen_string_literal: true

namespace :db do
  desc 'Fix "database is being accessed by other users'
  task terminate: :environment do
    ActiveRecord::Base.connection.execute <<~SQL.squish
      SELECT
        pg_terminate_backend(pid)
      FROM
        pg_stat_activity
      WHERE
        pid <> pg_backend_pid()
        AND datname = '#{ActiveRecord::Base.connection.current_database}';
    SQL
  end
end

Rake::Task['db:drop'].enhance(['db:terminate'])
