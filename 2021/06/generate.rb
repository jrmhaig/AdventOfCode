#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'fish_group'

groups = 7.times.map { |i| FishGroup.new(i) }
7.times { |i| groups[i].child_group = groups[(i + 2) % 7] }

File.open('input.txt').read.chomp.split(',').tally.each_pair do |i, count|
  groups[i.to_i].adults = count
end

80.times { groups.each(&:grow) }
puts "1; #{groups.sum(&:count)}"

(256 - 80).times { groups.each(&:grow) }
puts "2; #{groups.sum(&:count)}"
