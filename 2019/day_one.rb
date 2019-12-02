$LOAD_PATH << File.expand_path('lib', __dir__)
require 'day_one'

data = File.read('inputs/day_one_input.txt').split("\n").map(&:to_i)
puts "Part one: #{DayOne.new(*data).fuel_required}"
