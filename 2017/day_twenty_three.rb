$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'advent_of_code/day_twenty_three'

rules = File.read('day_twenty_three_input.txt').chomp.split(/\n/)

coprocessor = AdventOfCode::DayTwentyThree.new *rules

coprocessor.run
puts "Part one: #{coprocessor.mul_count}"

# As far as I can tell, the program is just counting all the non-primes between
# 109900 and 126900 so ...
require 'prime'
b = 9900 + 100000
c = b + 17000

h = 0
b.step(c, 17).each { |i|
  h += 1 unless Prime.prime?(i)
}
puts "Part two: #{h}"
