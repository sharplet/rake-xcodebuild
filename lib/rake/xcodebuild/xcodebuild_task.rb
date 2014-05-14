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
      @name ||= action ? action.to_sym : :build
    end

    # The Xcode project file.
    attr_accessor :project
    def project=(project)
      @project = project.ext('.xcodeproj')
    end
    alias_method :xcodeproj=, :project=

    # The Xcode workspace file.
    attr_accessor :workspace
    def workspace=(workspace)
      @workspace = workspace.ext('.xcworkspace')
    end

    # The Xcode scheme.
    attr_accessor :scheme

    # Array of arbitrary xcodebuild options to pass through.
    attr_accessor :xcodebuild_opts
    def xcodebuild_opts
      @xcodebuild_opts ||= []
    end

    def initialize(name = nil)
      @name = name
      yield self if block_given?
      define
    end

    def define
      task(name) do |t|
        sh ['xcodebuild', action, *project_args, *xcodebuild_opts].join(" ")
      end
      self
    end

    def project_args
      args_for_attrs(:project, :workspace, :scheme)
    end

    def args_for_attrs(*attrs)
      attrs.reduce([]) do |args, key|
        value = send(key)
        value ? args.push("-#{key}", value) : args
      end
    end
    private :args_for_attrs

  end

end
