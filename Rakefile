require 'bundler/gem_tasks'
require 'rake/xcodebuild'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
  t.test_files = FileList['test/test*.rb']
end

namespace :test do
  desc "Run tests whenever something is written to a named pipe"
  task :react do
    exec './react.rb', 'bundle', 'exec', 'rake'
  end
end
