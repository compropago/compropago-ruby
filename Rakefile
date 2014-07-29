require "bundler/gem_tasks"
require 'rake/testtask'
Bundler::GemHelper.install_tasks

task :console do
  Rake::Task["build"].invoke
  Rake::Task["install"].invoke
  puts "Loading development console..."
  system("irb -r compropago")
end

task :help do
  puts "Available rake tasks: "
  puts "rake console - Run a IRB console with all enviroment loaded"
  puts "rake test - Run tests"
end

Rake::TestTask.new("test:regular") do |t|
  t.libs = ["test"]
  t.pattern = "test/*_test.rb"
  t.ruby_opts = ['-w']
end

Rake::TestTask.new("test:models") do |t|
  t.libs = ["test"]
  t.pattern = "test/models/*_test.rb"
  t.ruby_opts = ['-w']
end

task :default => :test
task :test => ['test:regular', 'test:models']
