# Rake::Xcodebuild [![Build Status](https://travis-ci.org/sharplet/rake-xcodebuild.svg?branch=master)](https://travis-ci.org/sharplet/rake-xcodebuild)

Automate tedious and repetitive configuration of `xcodebuild` command line options.

Running your tests via `rake test` is as easy as putting this in your `Rakefile`:

```ruby
require 'rake/xcodebuild'

task :default => [:test]

Rake::XcodebuildTask.new do |t|
  t.action = 'test'
  t.workspace = 'MyProject' # => automatically looks for MyProject.xcworkspace
  t.scheme = 'MyProject'
  t.xcodebuild_opts << '-sdk iphonesimulator'
end
# => `xcodebuild test -workspace MyProject.xcworkspace -scheme MyProject -sdk iphonesimulator`
```

## Installation

Add this line to your application's Gemfile:

    gem 'rake-xcodebuild'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake-xcodebuild

## Contributing

See the [Guidelines for Contributing](http://github.com/sharplet/rake-xcodebuild/blob/master/CONTRIBUTING.md).
