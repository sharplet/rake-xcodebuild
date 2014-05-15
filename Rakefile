require 'bundler/gem_tasks'
require 'rake/xcodebuild'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
  t.test_files = FileList['test/test*.rb']
  p t.file_list_string
end

namespace :test do
  desc "Run tests whenever something is written to a named pipe"
  task :react do
    exec './react.rb', 'rake', 'test'
  end
end
