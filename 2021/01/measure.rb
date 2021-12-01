#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'compare'
require 'simple_group'
require 'multi_group'

data = File.open('input.txt').readlines.map(&:to_i)

groups = SimpleGroup.new(data)
compare = Compare.new(groups)
puts "Part 1; #{compare.sum}"

groups = MultiGroup.new(data)
compare = Compare.new(groups)
puts "Part 2; #{compare.sum}"
