#!/bin/env ruby

class Xmas
  def initialize preamble
    @ring = preamble
  end

  def append n
    if valid? n
      @ring.shift
      @ring << n
      true
    else
      false
    end
  end

  private
  def valid? n
    @ring.each do |i|
      return true if (@ring - [i]).include?(n-i)
    end
    return false
  end
end

numbers = File.readlines('day_nine_input.txt').map(&:to_i)
xmas = Xmas.new numbers[0,25]
invalid = nil
numbers[25..].each do |i|
  if xmas.append(i) == false
    invalid = i
    break
  end
end
puts "1) #{invalid}"

first = nil
last = nil
numbers.length.times do |i|
  (i+1).upto(numbers.length-1) do |j|
    if numbers[i..j].sum == invalid
      first = i
      last = j
      break
    elsif numbers[i..j].sum > invalid
      break
    end
  end
  break if first
end
min = numbers[first..last].min
max = numbers[first..last].max
puts "2) #{min+max}"
