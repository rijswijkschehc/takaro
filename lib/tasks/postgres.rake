# frozen_string_literal: true

namespace :db do
  desc 'Dump the production database'
  task dump: :environment do
    `heroku pg:backups:capture`
  end

  desc 'Load the pulled production database'
  task load: :environment do
    config = Rails.configuration.database_configuration[Rails.env]

    `pg_restore -h 127.0.0.1 -d #{config['database']} -U #{config['username']} --data-only tmp/production.dump`
  end

  desc 'Pull the dumped production database'
  task pull: :environment do
    `heroku pg:backups:download -o tmp/production.dump`
  end

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
