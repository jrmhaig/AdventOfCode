#!/usr/bin/env ruby

# Read in the input file
input = File.read('input.txt').split("\n")

# Split the input data into two arrays of integers and sort
split = input.map { |line| line.split(' ').map(&:to_i) }
left = split.map(&:first).sort
right = split.map(&:last).sort

# Find distances between corresponding elements
puts "Part 1: #{left.zip(right).sum { |l, r| (l - r).abs }}"

# Find the 'similarity' between the two arrays
puts "Part 2: #{left.sum { |l| right.count(l) * l }}"