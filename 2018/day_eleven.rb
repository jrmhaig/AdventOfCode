#!/usr/bin/env ruby

SERIAL = 9435

t1 = Time.now

def power x, y
  (((x + 10) * y + SERIAL) * (x + 10) / 100) % 10 - 5
end

squares = Array.new(300) { Array.new(300, 0) }
powers = Array.new(300) { Array.new(300) }

1.upto(300) do |x|
  1.upto(300) do |y|
    powers[x-1][y-1] = power x, y
    3.times do |i|
      next if x - i < 1
      3.times do |j|
        next if y - j < 1
        squares[x - i - 1][y - j - 1] += powers[x-1][y-1]
      end
    end
  end
end

max_by_row = squares.map(&:max)

i = max_by_row.index(max_by_row.max)
j = squares[i].index(squares[i].max)
puts "Part one: #{i + 1},#{j + 1}"

t2 = Time.now

max_power = -1
i_max = nil
j_max = nil
k_max = nil
300.times do |i|
  300.times do |j|
    p = 0
    (300 - [i, j].max).times do |k|
      p += powers[i + k][j + k]
      k.times do |l|
        p += powers[i + k][j + l] + powers[i + l][j + k]
      end
      if p > max_power
        max_power = p
        i_max = i
        j_max = j
        k_max = k
      end
    end
  end
end

puts "Part two: #{i_max + 1},#{j_max + 1},#{k_max + 1}"
t3 = Time.now

puts "Part one time: #{t2 - t1} seconds"
puts "Part one time: #{t3 - t2} seconds"
