# Custom cucumber rake task
# Defined here in heed of the warning at top of the cucumber.rake file

Begin
require 'cucumber/rake/task'
namespace :cucumber do
  Cucumber::Rake::Task.new(:set_silent_fail, 'Run features but do not open browser on fail') do |t|
    ENV['FAIL_SILENT'] = 'true'
  end
  
  desc 'Run all features but do not open browser on fail'
  task :silent => [:set_silent_fail, :all]
end

rescue LoadError
  desc 'cucumber rake task not available (cucumber not installed)'
  task :cucumber do
    abort 'Cucumber rake task is not available. Be sure to install cucumber as a gem or plugin'
  end
end
