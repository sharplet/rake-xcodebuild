# Define an umbrella task library for running multiple xcode scheme actions

require 'rake'
require 'rake/tasklib'
require 'ostruct'

module Rake

  class XCSchemeTask < TaskLib

    DEFAULT_ACTIONS = %w[build test]

    # The list of scheme actions to generate tasks for.
    attr_reader :actions

    # A hash-like structure yielded to the #initialize block. The
    # configured attributes will be applied globally to each build task
    # that is generated.
    attr_reader :attrs

    # A hash of the tasks generated by this task lib.
    attr_reader :tasks

    def initialize
      @attrs = OpenStruct.new(:actions => DEFAULT_ACTIONS)
      yield @attrs if block_given?
      @actions = @attrs.delete_field(:actions).flatten
      @tasks = {}
      define
    end

    def define
      actions.each do |action|
        task = XcodebuildTask.new do |t|
          t.action = action
          attrs.each_pair do |k, v|
            t.send("#{k}=", v)
          end
        end
        tasks[task.name] = task
      end
      self
    end

  end

end
