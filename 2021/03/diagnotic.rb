#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'sub_state'
require 'line'

state = SubState.new

File.open('input.txt').readlines.each do |line|
  state.accept(Line.new(line.chomp))
end

puts "1; #{state.power_consumption}"
