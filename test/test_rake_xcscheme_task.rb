require_relative 'helper'
require 'rake/xcodebuild/xcscheme_task'

class TestRakeXcodebuildTask < Rake::TestCase
  include Rake

  def test_initialize
    xst = Rake::XCSchemeTask.new
    assert_equal ['build', 'test'], xst.actions
    assert Task.task_defined?(:build), "expected :build task to be defined"
    assert Task.task_defined?(:test), "expected :test task to be defined"
  end

  def test_build_actions_configured
    xst = Rake::XCSchemeTask.new do |t|
      t.project = 'MyProject'
      t.workspace = 'MyProject'
      t.scheme = 'Demo'
    end
    assert_equal 'MyProject.xcodeproj', xst.tasks[:build].xcodeproj
    assert_equal 'MyProject.xcodeproj', xst.tasks[:test].xcodeproj
    assert_equal 'MyProject.xcworkspace', xst.tasks[:build].workspace
    assert_equal 'MyProject.xcworkspace', xst.tasks[:test].workspace
    assert_equal 'Demo', xst.tasks[:build].scheme
    assert_equal 'Demo', xst.tasks[:test].scheme
  end

end
