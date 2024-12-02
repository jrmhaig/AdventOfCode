#!/usr/bin/env ruby

# Read in the input file
input = File.read('input.txt').split("\n")

# Split each row of the input into an array of integers
reports = input.map { |line| line.split(' ').map(&:to_i) }

def safety_check(*data)
  increasing = data.each_cons(2).all? { |a, b| b > a }
  decreasing = data.each_cons(2).all? { |a, b| b < a }
  steps = data.each_cons(2).map { |a, b| (b - a).abs }
  (increasing || decreasing) && steps.min > 0 && steps.max < 4
end

# Count the number of safe reports
safety_count = reports.count { |report| safety_check(*report) }

puts "Part 1: #{safety_count}"

# Count the number of safe reports with the problem dampener
safety_count = reports.count do |report|
  safety_check(*report) ||
    report.count.times.any? { |i| safety_check(*report.dup.tap { |r| r.delete_at(i) }) }
end

puts "Part 2: #{safety_count}"