#!/usr/bin/env ruby

example = '2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2'

t1 = Time.now
#data = example.split(/\s+/).map(&:to_i)
data = File.read('day_eight_input.txt').split(/\s+/).map(&:to_i)

def part_one data
  children = data.shift
  metadata = data.shift
  sum = 0
  children.times do
    sum += part_one data
  end
  metadata.times do
    sum += data.shift
  end
  sum
end

puts "Part one: #{part_one data}"

t2 = Time.now
data = File.read('day_eight_input.txt').split(/\s+/).map(&:to_i)

def part_two data
  children = data.shift
  metadata = data.shift
  sum = 0
  if children.positive?
    sums = children.times.map do 
      part_two data
    end
    metadata.times do
      sum += sums[data.shift - 1].to_i
    end
  else
    metadata.times do
      sum += data.shift
    end
  end
  sum
end

puts "Part two: #{part_two data}"

t3 = Time.now

puts "Part one time: #{t2 - t1} seconds"
puts "Part two time: #{t3 - t2} seconds"
