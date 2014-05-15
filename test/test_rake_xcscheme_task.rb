require_relative 'helper'
require 'rake/xcscheme_task'

class TestRakeXcschemeTask < Rake::TestCase
  include Rake

  def test_initialize
    xst = Rake::XCSchemeTask.new
    assert_nil xst.name
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
    assert_equal 'MyProject.xcodeproj', xst.tasks[:build].project
    assert_equal 'MyProject.xcodeproj', xst.tasks[:test].project
    assert_equal 'MyProject.xcworkspace', xst.tasks[:build].workspace
    assert_equal 'MyProject.xcworkspace', xst.tasks[:test].workspace
    assert_equal 'Demo', xst.tasks[:build].scheme
    assert_equal 'Demo', xst.tasks[:test].scheme

    xst = Rake::XCSchemeTask.new('Scheme')
    assert_equal 'Scheme', xst.tasks[:build].scheme
    assert_equal 'Scheme', xst.tasks[:test].scheme
  end

end
