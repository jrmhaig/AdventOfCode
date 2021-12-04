#!/usr/bin/env ruby

$LOAD_PATH << File.expand_path('lib', __dir__)

require 'card'
require 'bingo_caller'

data = File.open('input.txt').readlines.map(&:chomp).select { |row| row != '' }

numbers = data.shift.split(/,/).map(&:to_i)

bingo_caller = BingoCaller.new
cards = data.each_slice(5).map { |card| Card.new(*card) }
cards.each { |card| bingo_caller.attach(card) }

numbers.each do |n|
  bingo_caller.call(n)
  break if cards.any?(&:won?)
end

puts "1; #{cards.select(&:won?).first.score * bingo_caller.latest}"

(rejects, cards) = cards.partition(&:won?)
rejects.each { |card| bingo_caller.detatch(card) }

rejects = nil
numbers.each do |n|
  bingo_caller.call(n)
  (rejects, cards) = cards.partition(&:won?)
  rejects.each { |card| bingo_caller.detatch(card) }
  break if bingo_caller.players == 0
end

puts "2; #{rejects.last.score * bingo_caller.latest}"
