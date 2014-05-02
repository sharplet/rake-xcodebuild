require_relative 'helper'
require 'rake/xcode/xcodebuild_task'

class TestRakeXcodebuildTask < Rake::TestCase
  include Rake

  def test_initialize
    xct = Rake::XcodebuildTask.new do |t| end
    refute_nil xct
    # assert_equal :build, xct.name
    # assert Task.task_defined?(:build)
  end

end
