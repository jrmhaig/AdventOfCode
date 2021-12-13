#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'paper'
require 'fold_along_x'
require 'fold_along_y'

data = File.open('input.txt').readlines.map(&:chomp)

points = data.select { |p| /\d+,\d+/.match(p) }.map { |p| p.split(',').map(&:to_i) }
folds = data.select { |datum| /^fold/.match(datum) }.map do |f|
  f.gsub(' ', '_').split(/=/)
end

paper = Paper.new(*points, commands: [FoldAlongX, FoldAlongY])

fold = folds.shift
paper.execute(fold[0], fold[1].to_i)

puts "1) #{paper.count}"

folds.each { |fold| paper.execute(fold[0], fold[1].to_i) }

puts "2)"
paper.display
