$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_sixteen'

moves = File.read('day_sixteen_input.txt').chomp.split(/,/)

line = AdventOfCode::DaySixteen.new ('a'..'p').to_a
line.dance *moves

puts "Part one: #{line.order}"

i = 1
while line.order != 'abcdefghijklmnop'
  line.dance *moves
  i += 1
end

remainder = 1_000_000_000 % i
remainder.times do
  line.dance *moves
end

puts "Part two: #{line.order}"
