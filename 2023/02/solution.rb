$LOAD_PATH << File.expand_path('lib', __dir__)

require 'game'
require 'validator'

input = File.read('input.txt').split(/\n/)

validator = Validator.new(red: 12, green: 13, blue: 14)
games = input.map { |game| Game.new(game, validator:) }
part_1 = games.select(&:valid?).sum(&:id)
puts "Part 1: #{part_1}"

part_2 = games.sum(&:power)
puts "Part 2: #{part_2}"
