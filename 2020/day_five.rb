#!/bin/env ruby

class Seat
  def initialize data
    @row = to_int(data[0, 7], 'F', 'B')
    @col = to_int(data[7, 3], 'L', 'R')
  end

  def id
    @row * 8 + @col
  end

  private
  def to_int value, zero, one
    value.tr(zero, '0').tr(one, '1').to_i(2)
  end
end

seats = File.read('day_five_input.txt')
  .split("\n")
  .map { |data| Seat.new(data) }

puts "1) #{seats.map(&:id).max}"

puts "2) #{seats.map(&:id).sort.inject(-1) do |candidate, i|
  break candidate if i == candidate + 1
  i + 1
end}"
