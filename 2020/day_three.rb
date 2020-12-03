#!/bin/env ruby

class Row
  def initialize line
    @line = line
  end

  def crash? col
    @line[col % @line.length] == '#'
  end
end

slope = File.read('day_three_input.txt').split("\n").map { |line, i| Row.new line }

puts "1) #{slope.each_with_index.select { |row, i| row.crash?(3 * i) }.count}"

puts "2) #{[
  slope.each_with_index.select { |row, i| row.crash?(i) }.count,
  slope.each_with_index.select { |row, i| row.crash?(3*i) }.count,
  slope.each_with_index.select { |row, i| row.crash?(5*i) }.count,
  slope.each_with_index.select { |row, i| row.crash?(7*i) }.count,
  slope.each_with_index.select { |row, i| (i % 2 == 0) && row.crash?(i/2) }.count
].inject(&:*)}"
