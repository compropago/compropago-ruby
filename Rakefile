require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new(:unit) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/unit_test.rb']
end

Rake::TestTask.new(:contract) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/contract/**/*_test.rb']
end

Rake::TestTask.new(:full) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end


task :default => :full

