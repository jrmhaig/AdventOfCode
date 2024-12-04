#!/usr/bin/env ruby

# Read the input file
input = File.read('input.txt').split("\n")

# Find XMASs in the input
count = 0
input.each_with_index.map do |row, y|
  row.split('').each_with_index do |col, x|
    # Look right
    count += 1 if x + 3 < row.length && row[x, 4] == 'XMAS'
    # Look left
    count += 1 if x - 3 >= 0 && row[x - 3, 4] == 'SAMX'
    # Look up
    count += 1 if y - 3 >= 0 && input[y][x] == 'X' && input[y - 1][x] == 'M' && input[y - 2][x] == 'A' && input[y - 3][x] == 'S'
    # Look down
    count += 1 if y + 3 < input.length && input[y][x] == 'X' && input[y + 1][x] == 'M' && input[y + 2][x] == 'A' && input[y + 3][x] == 'S'
    # Look up left
    count += 1 if y - 3 >= 0 && x - 3 >= 0 && input[y][x] == 'X' && input[y - 1][x - 1] == 'M' && input[y - 2][x - 2] == 'A' && input[y - 3][x - 3] == 'S'
    # Look up right
    count += 1 if y - 3 >= 0 && x + 3 < row.length && input[y][x] == 'X' && input[y - 1][x + 1] == 'M' && input[y - 2][x + 2] == 'A' && input[y - 3][x + 3] == 'S'
    # Look down left
    count += 1 if y + 3 < input.length && x - 3 >= 0 && input[y][x] == 'X' && input[y + 1][x - 1] == 'M' && input[y + 2][x - 2] == 'A' && input[y + 3][x - 3] == 'S'
    # Look down right
    count += 1 if y + 3 < input.length && x + 3 < row.length && input[y][x] == 'X' && input[y + 1][x + 1] == 'M' && input[y + 2][x + 2] == 'A' && input[y + 3][x + 3] == 'S'
  end
end

puts "Part one: #{count}"

# Find the MAX crosses
count = 0
(input.length - 2).times do |y|
  (input[y+1].length - 2).times do |x|
    corner_tally = [input[y][x], input[y][x+2], input[y+2][x], input[y+2][x+2]].tally
    count += 1 if input[y+1][x+1] == 'A' && input[y][x] != input[y+2][x+2] && corner_tally['M'] == 2 && corner_tally['S'] == 2
  end
end

puts "Part two: #{count}"