#!/usr/bin/env ruby

input = File.read('input_day_7.txt').split(/\n/)
#input = File.read('day_7_test.txt').split(/\n/)

def good_match line
  match = /((\w)(\w)\3\2)/
  bad_match = /(\w)\1\1\1/
  bits = [[], []]
  line.split(/[\[\]]/).each_with_index do |part, i|
    bits[i%2] << part
  end
  bits[1].each do |str|
    str.scan(match).each do |m|
      return false if bad_match !~ m[0]
    end
  end
  bits[0].each do |str|
    x = str.scan(match)
    x.each do |m|
      return true if bad_match !~ m[0]
    end
  end
  false
end

count = 0
input.each do |line|
  if good_match line
    puts line
    count = count + 1 if good_match line
  end
end

puts "Count: #{count}"
