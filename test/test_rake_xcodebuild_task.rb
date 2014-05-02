require_relative 'helper'
require 'rake/xcode/xcodebuild_task'

class TestRakeXcodebuildTask < Rake::TestCase
  include Rake

  def test_initialize
    xct = Rake::XcodebuildTask.new
    refute_nil xct
    assert_nil xct.action
    assert Task.task_defined?(xct.name), "expected task to be defined after #initialize"
  end

  def test_task_name_defaults
    default_task = Rake::XcodebuildTask.new
    assert_equal :build, default_task.name

    custom_action = Rake::XcodebuildTask.new do |t|
      t.action = 'test'
    end
    assert_equal :test, custom_action.name

    custom_name = Rake::XcodebuildTask.new do |t|
      t.action = :build
      t.name = :build_debug
    end
    assert_equal :build_debug, custom_name.name
  end

  def test_project_args_xcodeproj
    project_only = Rake::XcodebuildTask.new do |t|
      t.xcodeproj = 'Project.xcodeproj'
    end
    expected = ['-xcodeproj', 'Project.xcodeproj']
    assert_equal expected, project_only.project_args
  end

  def test_project_args_xcodeproj_scheme
    project_and_scheme = Rake::XcodebuildTask.new do |t|
      t.xcodeproj = 'Project.xcodeproj'
      t.scheme = 'Debug'
    end
    expected = ['-xcodeproj', 'Project.xcodeproj', '-scheme', 'Debug']
    assert_equal expected, project_and_scheme.project_args
  end

  def test_project_args_workspace_scheme
    workspace_and_scheme = Rake::XcodebuildTask.new do |t|
      t.workspace = 'Project.xcworkspace'
      t.scheme = 'Project'
    end
    expected = ['-workspace', 'Project.xcworkspace', '-scheme', 'Project']
    assert_equal expected, workspace_and_scheme.project_args
  end

end
