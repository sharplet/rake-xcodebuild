require 'bundler/gem_tasks'
require 'rake/xcodebuild'
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
  t.ruby_opts << '-rminitest/pride'
end
