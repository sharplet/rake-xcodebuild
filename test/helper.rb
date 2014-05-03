# Load rake test helper
RAKE_GEM_PATH = Gem::Specification.find_by_path('rake').full_gem_path
$:.tap do |load_path|
  load_path.unshift RAKE_GEM_PATH
  require File.join RAKE_GEM_PATH, "test/helper"
  load_path.delete RAKE_GEM_PATH
end

# Colourise test output
require "minitest/pride"
