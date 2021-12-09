#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'tube'
require 'basin'

tubes = []
last_row = []
File.open('input.txt').readlines.map(&:chomp).each do |line|
  last_tube = nil
  row = line.split(//).each_with_index.map do |t, i|
    Tube.new(t).tap do |tube|
      [last_tube, last_row[i]].compact.each do |other|
        tube.neighbours << other
        other.neighbours << tube
      end
      last_tube = tube
    end
  end
  last_row = row
  tubes += row
end

puts "1) #{tubes.select(&:minimum?).sum(&:risk)}"

basins = tubes.select(&:minimum?).map { |tube| Basin.new(tube) }

puts "2) #{basins.map(&:size).max(3).inject(&:*)}"
