#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)
require 'day_three'

wires = DayThree.new(*File.read('inputs/day_three_input.txt').split("\n"))
puts "Part three: #{wires.closest_distance}"
