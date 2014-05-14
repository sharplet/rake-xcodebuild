require 'bundler/gem_tasks'
require 'rake/xcodebuild'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new

namespace :test do
  desc "Run tests whenever something is written to a named pipe"
  task :react do
    exec './react.rb', 'rake', 'test'
  end
end
