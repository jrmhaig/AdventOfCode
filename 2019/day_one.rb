#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)
require 'day_one'

rocket = DayOne.new(*File.read('inputs/day_one_input.txt').split("\n").map(&:to_i))
puts "Part one: #{rocket.fuel_required}"
puts "Part two: #{rocket.fuel_required_extra}"
