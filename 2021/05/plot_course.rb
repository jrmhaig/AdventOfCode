#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'factories/one'
require 'factories/two'
require 'sweep'

data = File.open('input.txt').readlines.map(&:chomp)

factory = Factories::One.new
vents = data.map { |vent| factory.create(vent) }
puts "1; #{Sweep.new(*vents).call}"

factory = Factories::Two.new
vents = data.map { |vent| factory.create(vent) }
puts "2; #{Sweep.new(*vents).call}"
