#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'polymer'
require 'node_factory'

data = File.open('input.txt').readlines.map(&:chomp)

factory = NodeFactory.new

template = data.shift

data.shift
data.each { |line| factory.fetch(*line.gsub(' -> ', '').split(//)) }

polymer = Polymer.new(*template.split(//).each_cons(2).map { |sl| factory.fetch(*sl) })

counts = polymer.draw(10).values
puts "1) #{counts.max - counts.min}"

counts = polymer.draw(40).values
puts "2) #{counts.max - counts.min}"
