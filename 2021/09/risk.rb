#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'tube'

tubes = []
last_row = nil
File.open('input.txt').readlines.map(&:chomp).each do |line|
  last_tube = nil
  row = line.split(//).each_with_index.map do |t, i|
    Tube.new(t).tap do |tube|
      if last_tube
        tube.west = last_tube
        last_tube.east = tube
      end
      if last_row
        tube.north = last_row[i]
        last_row[i].south = tube
      end
      last_tube = tube
    end
  end
  last_row = row
  tubes += row
end

puts "1) #{tubes.select(&:minimum?).sum(&:risk)}"
