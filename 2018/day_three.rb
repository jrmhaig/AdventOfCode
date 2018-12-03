#!/usr/bin/env ruby

claims = File.read('day_three_input.txt').split(/\n/)

t1 = Time.now
pattern = /#(\d+) @ (\d+),(\d+): (\d+)x(\d+)/.freeze

cover = {}
claims.each do |claim|
  id, x_offset, y_offset, x, y = pattern.match(claim).captures.map(&:to_i)
  x_offset.upto(x_offset + x - 1) do |i|
    y_offset.upto(y_offset + y - 1) do |j|
      pos = [i, j]
      if cover.key? pos
        cover[pos] += 1
      else
        cover[pos] = 1
      end
    end
  end
end

puts "Part one: #{cover.select { |_pos, count| count > 1 }.count}"

t2 = Time.now

# Deliberately re-doing all the work to get the timings
cover = {}
candidates = []
claims.each do |claim|
  id, x_offset, y_offset, x, y = pattern.match(claim).captures.map(&:to_i)
  overlap = false
  x_offset.upto(x_offset + x - 1) do |i|
    y_offset.upto(y_offset + y - 1) do |j|
      pos = [i, j]
      if cover.key? pos
        cover[pos] << id
        overlap = true
      else
        cover[pos] = [id]
      end
    end
  end
  candidates << id unless overlap
end

good = candidates - cover.select { |_pos, count| count.count > 1 }.values.flatten.uniq

puts "Part two: #{good.first}"

t3 = Time.now

puts "Time for part one: #{t2 - t1} seconds"
puts "Time for part two: #{t3 - t2} seconds"
