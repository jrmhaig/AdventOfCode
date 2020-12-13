#!/bin/env ruby

class Bus
  attr_reader :index, :n

  def initialize n, index
    @n = n
    @index = index
  end

  def gone(t)
    t / @n + 1
  end

  def next_in(t)
    (gone(t) * @n - t) % @n
  end

  def solution t
    @n * next_in(t)
  end

  def in_sequence t
    (t + @index) % @n == 0
  end
end

inputs = File.readlines('day_thirteen_input.txt').map(&:chomp)
time = inputs[0].to_i

busses = inputs[1].split(',')
  .each_with_index.map { |b, i| Bus.new(b.to_i, i) if b != 'x' }.compact

puts "1) #{busses.sort_by { |bus| bus.next_in(time) }.first.solution(time)}"


# See https://rosettacode.org/wiki/Chinese_remainder_theorem#Ruby
def extended_gcd(a, b)
  last_remainder, remainder = a.abs, b.abs
  x, last_x, y, last_y = 0, 1, 1, 0
  while remainder != 0
    last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
    x, last_x = last_x - quotient*x, x
    y, last_y = last_y - quotient*y, y
  end
  return last_remainder, last_x * (a < 0 ? -1 : 1)
end
 
def invmod(e, et)
  g, x = extended_gcd(e, et)
  if g != 1
    raise 'Multiplicative inverse modulo does not exist!'
  end
  x % et
end
 
def chinese_remainder(mods, remainders)
  max = mods.inject( :* )  # product of all moduli
  series = remainders.zip(mods).map{ |r,m| (r * max * invmod(max/m, m) / m) }
  series.inject( :+ ) % max 
end

puts "2) #{chinese_remainder(busses.map(&:n), busses.map { |bus| -bus.index })}"
