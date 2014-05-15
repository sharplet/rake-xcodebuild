# Given an XcodebuildTask, format its description.

module Rake
  module Xcodebuild

    class DescriptionFormatter

      # The xcodebuild task to describe.
      attr_reader :task

      def initialize(task)
        @task = task
      end

      def to_s
        "#{action} #{subject} #{suffix}"
      end

      # Description of the build action.
      def action
        if task.action == 'test'
          "Run tests for"
        else
          "Build"
        end
      end

      # The subject of the build action (target or scheme).
      def subject
        if task.scheme
          "scheme #{task.scheme}"
        else
          target = task.target ? "target #{task.target}"
                               : "the default target"
          if task.project
            "#{target} in #{task.project}"
          else
            target
          end
        end
      end

      # Additional information about the build action.
      def suffix
        case task.action.to_s
        when 'install'
          "and install"
        end
      end

    end

  end
end
