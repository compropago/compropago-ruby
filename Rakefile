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
