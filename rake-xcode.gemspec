# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/xcode/version'

Gem::Specification.new do |spec|
  spec.name          = "rake-xcode"
  spec.version       = Rake::Xcode::VERSION
  spec.authors       = ["Adam Sharp"]
  spec.email         = ["adsharp@me.com"]
  spec.summary       = "Rake extensions for working with Xcode."
  # spec.description   = ""
  # spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rake"

  spec.add_development_dependency "bundler", "~> 1.5"
end
