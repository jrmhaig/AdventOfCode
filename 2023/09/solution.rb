$LOAD_PATH << File.expand_path('lib', __dir__)

require 'values'

values = File.read('input.txt').split(/\n/)
  .map { |line| Values.new(*line.split(/\s+/).map(&:to_i)) }

puts "Part 1: #{values.sum(&:next)}"
puts "Part 2: #{values.sum(&:prev)}"
