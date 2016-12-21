require 'bundler/gem_tasks'
require 'rake/testtask'
require 'compropago_sdk'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

Rake::TestTask.new(:validations) do
  obj = Client.new('pk_test_638e8b14112423a086', 'sk_test_9c95e149614142822f', false)


end

Rake

task :default => :test
