#!/bin/env ruby

class Game
  def initialize *seed
    @numbers = *seed
  end

  def [] n
    @numbers[n-1] if @numbers.length >= n

    @numbers.length.upto(n-1) do
      @numbers << next_number
    end
    @numbers.last
  end

  def next_number
    @numbers.each_with_index
      .map { |x, i| x == @numbers[-1] ? i : nil }
      .compact[-2..]
      &.reverse
      &.inject(&:-).to_i
  end
end

game = Game.new *File.read('day_fifteen_input.txt').chomp.split(/,/).map(&:to_i)

puts "1) #{game[2020]}"
