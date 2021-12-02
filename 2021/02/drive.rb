#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'submarine'
require 'driver'
require 'command_one/forward'
require 'command_one/up'
require 'command_one/down'
require 'command_two/forward'
require 'command_two/up'
require 'command_two/down'

sub1 = Submarine.new
sub2 = Submarine.new
driver1 = Driver.new(sub1, CommandOne::Forward, CommandOne::Up, CommandOne::Down)
driver2 = Driver.new(sub2, CommandTwo::Forward, CommandTwo::Up, CommandTwo::Down)

File.open('input.txt').readlines.each do |line|
  (command, distance) = line.chomp.split(/\s/)
  driver1.execute(command, distance.to_i)
  driver2.execute(command, distance.to_i)
end

puts "Part 1; #{sub1.solution}"
puts "Part 2; #{sub2.solution}"
