#!/bin/env ruby

data = File.read('day_one_input.txt').split("\n").map(&:to_i).sort
first = 0
second = 1
third = 2

def get_sum(data, first, second, third)
  data[first] + data[second] + data[third]
end

while get_sum(data, first, second, third) < 2020
  while get_sum(data, first, second, third) < 2020
    while get_sum(data, first, second, third) < 2020
      third += 1
    end
    break if get_sum(data, first, second, third) == 2020
    second += 1
    third = second + 1
  end
  break if get_sum(data, first, second, third) == 2020
  first += 1
  second = first + 1
  third = second + 1
end

puts "#{data[first]} * #{data[second]} * #{data[third]} = #{data[first] * data[second] * data[third]}"
