#!/usr/bin/env ruby

# Read the input file
input = File.read('input.txt')

# Find instances of 'mul(*,*)'
matches = input.scan(/mul\((\d+),(\d+)\)/)

# Find sum
sum = matches.sum { |a, b| a.to_i * b.to_i }

puts "Part 1: #{sum}"

# Find instances of 'mul(*,*)', 'do()' and 'don't()'
matches = input.scan(/mul\(\d+,\d+\)|do\(\)|don\'t\(\)/)

# Find sum
active = true
sum = matches.sum do |match|
  case match
  when 'do()'
    active = true
    0
  when 'don\'t()'
    active = false
    0
  when /mul\((\d+),(\d+)\)/
    active ? $1.to_i * $2.to_i : 0
  end
end

puts "Part 2: #{sum}"