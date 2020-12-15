#!/bin/env ruby

class Game
  def initialize *seed
    @numbers = Array(seed).each_with_index.to_h
    @next = 0
  end

  def find n
    @numbers.values.max.upto(n-3) do |i|
      new_next = @numbers[@next].nil? ? 0 : i + 1 - @numbers[@next]
      @numbers[@next] = i + 1
      @next = new_next
    end

    @next
  end
end

seed = File.read('day_fifteen_input.txt').chomp.split(/,/).map(&:to_i)

puts "1) #{Game.new(*seed).find(2020)}"
puts "2) #{Game.new(*seed).find(30000000)}"
