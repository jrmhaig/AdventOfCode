#!/usr/bin/env ruby

SERIAL = 9435

t1 = Time.now

def power x, y
  (((x + 10) * y + SERIAL) * (x + 10) / 100) % 10 - 5
end

squares = Array.new(300) { Array.new(300, 0) }

1.upto(300) do |x|
  2.upto(300) do |y|
    p = power x, y
    3.times do |i|
      next if x - i < 1
      3.times do |j|
        next if y - j < 1
        squares[x - i - 1][y - j - 1] += p
      end
    end
  end
end

max_by_row = squares.map(&:max)

i = max_by_row.index(max_by_row.max)
j = squares[i].index(squares[i].max)
puts "Part one #{i + 1},#{j + 1}"

t2 = Time.now

puts "Part one time: #{t2 - t1} seconds"
