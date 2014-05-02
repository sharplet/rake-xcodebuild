# Define a task library for running xcode build actions

require 'rake'
require 'rake/tasklib'

module Rake

  class XcodebuildTask < TaskLib

    # The xcodebuild action to run. If not specified, xcodebuild's default
    # will be used.
    attr_accessor :action

    # The name of the task. (Defaults to either the action name or :build if
    # no action is specified.)
    attr_accessor :name
    def name
      @name ||= (action.to_sym if action) || :build
    end

    def initialize
      yield self if block_given?
      define
    end

    private

    def define
      task(name) do |t|
        sh *['xcodebuild', action].compact
      end
      self
    end

  end

end
