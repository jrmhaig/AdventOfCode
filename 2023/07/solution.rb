$LOAD_PATH << File.expand_path('lib', __dir__)

require 'hand'
require 'tester/normal'
require 'tester/joker'

input = File.read('input.txt')
  .split(/\n/)
  .map { |line| line.split(/\s+/) }

card_ranking = %w[2 3 4 5 6 7 8 9 T J Q K A]
tester = Tester::Normal
winnings = input.map { |pair| [Hand.new(pair.first, card_ranking:, tester:), pair.last] }.sort_by(&:first)
  .each_with_index.map { |pair, i| (i+1) * pair.last.to_i }.sum
puts "Part 1: #{winnings}"

card_ranking = %w[J 2 3 4 5 6 7 8 9 T Q K A]
tester = Tester::Joker
winnings = input.map { |pair| [Hand.new(pair.first, card_ranking:, tester:), pair.last] }.sort_by(&:first)
  .each_with_index.map { |pair, i| (i+1) * pair.last.to_i }.sum
puts "Part 2: #{winnings}"
    