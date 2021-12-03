#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'sub_state'
require 'line'
require 'scrubber'

state = SubState.new
lines = File.open('input.txt').readlines.map { |line| Line.new(line.chomp) }

lines.each { |line| state.accept(line) }

puts "1; #{state.power_consumption}"

o2 = Scrubber.new(lines: lines) { |n| n >= 0 }.call
co2 = Scrubber.new(lines: lines) { |n| n < 0 }.call

puts "2: #{o2*co2}"

