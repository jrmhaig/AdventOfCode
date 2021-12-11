#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'octopus'
require 'conductor'

conductor = Conductor.new

octopuses = []
last_row = []
File.open('input.txt').readlines.map(&:chomp).each do |line|
  last = nil
  row = line.split(//).each_with_index.map do |n, i|
    Octopus.new(n.to_i).tap do |oct|
      [last, last_row[i-1], last_row[i], last_row[i+1]].compact.each do |other|
        oct.attach(other)
        other.attach(oct)
      end
      conductor.attach(oct)
      last = oct
    end
  end
  # Append nil so that last_row[-1] returns nil, above
  last_row = row + [nil]
  octopuses += row
end.flatten

100.times { conductor.cycle }

puts "1) #{octopuses.sum(&:flash_count)}"

while conductor.cycle < 100 do; end

puts "2) #{conductor.cycles}"
