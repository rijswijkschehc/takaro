# frozen_string_literal: true

group :red_green_refactor, halt_on_fail: true do
  guard 'rspec', cmd: 'bin/rspec' do
    require 'guard/rspec/dsl'
    dsl = Guard::RSpec::Dsl.new(self)

    # RSpec files
    rspec = dsl.rspec
    watch(rspec.spec_helper) { rspec.spec_dir }
    watch(rspec.spec_support) { rspec.spec_dir }
    watch(rspec.spec_files)

    # Ruby files
    ruby = dsl.ruby
    dsl.watch_spec_files_for(ruby.lib_files)

    # Rails files
    rails = dsl.rails(view_extensions: %w[erb])
    dsl.watch_spec_files_for(rails.app_files)
    dsl.watch_spec_files_for(rails.views)

    watch(rails.controllers) do |m|
      [rspec.spec.call("controllers/#{m[1]}_controller")]
    end

    # Rails config changes
    watch(rails.spec_helper) { rspec.spec_dir }
    watch(rails.app_controller) { "#{rspec.spec_dir}/controllers" }

    # Capybara features specs
    watch(rails.view_dirs) { |m| rspec.spec.call("features/#{m[1]}") }
    watch(rails.layouts) { |m| rspec.spec.call("features/#{m[1]}") }
  end

  guard 'rubocop', all_on_start: false, cli: %w[--format fuubar] do
    watch(/.+\.rb$/)
    watch(%r{(?:.+/)?\.rubocop(?:_todo)?\.yml$}) { |m| File.dirname(m[0]) }
  end
end
