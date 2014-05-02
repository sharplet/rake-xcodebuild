RAKE_GEM_PATH = Gem::Specification.find_by_path('rake').full_gem_path

require File.join RAKE_GEM_PATH, "test/helper"
