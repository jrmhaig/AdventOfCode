$LOAD_PATH << File.expand_path('lib', __dir__)

require 'line'
require 'number_extractor/just_numbers'
require 'number_extractor/with_words'

input = File.read('input.txt').split

part1_solution = input.map { |row| Line.new(row, extractor: NumberExtractor::JustNumbers).calibration_value }.sum
puts "Part 1 solution: #{part1_solution}"

part2_solution = input.map { |row| Line.new(row, extractor: NumberExtractor::WithWords).calibration_value }.sum
puts "Part 2 solution: #{part2_solution}"
