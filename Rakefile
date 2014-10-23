# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rspec/core/rake_task'

BikeBike::Application.load_tasks

RSpec::Core::RakeTask.new(:rspec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rspec_opts = ['-c --backtrace']
end

task :default => [:rspec, :cucumber]
