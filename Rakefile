require "bundler/gem_tasks"
require 'rake/testtask'

Dir["#{File.dirname(__FILE__)}/tasks/*.rake" ].each{ |rake_file| load rake_file }

task :default => [:test]

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = "test/**/test_*.rb"
  t.verbose = true
  t.warning = true
end
Rake::Task['test'].comment = "Run all i18n tests"
