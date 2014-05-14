#!/usr/bin/env ruby

require 'optparse'
require 'fileutils'
self.extend(FileUtils)

FIFO = File.expand_path("../.react_fifo", __FILE__)

OptionParser.new do |opts|
  opts.banner = "Usage: react.rb [options] command [argument ..]"

  opts.on("-f", "--fifo PATH", "Specify custom fifo path") do |f|
    FIFO = f
  end
end.parse!

if ARGV.empty?
  STDERR.puts "fatal: You must specify a command to run."
  exit 1
end

system "mkfifo #{FIFO}" unless File.exist?(FIFO)

trap "INT" do
  puts
  rm_f FIFO
  exit
end

while File.read(FIFO)
  system *ARGV
end
