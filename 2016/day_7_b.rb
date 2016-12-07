#!/usr/bin/env ruby

input = File.read('input_day_7.txt').split(/\n/)
#input = File.read('input_day_7_b.txt').split(/\n/)
#input = File.read('day_7_b_test.txt').split(/\n/)

def good_match line
  match = /((\w)(\w)\2)/
  puts line
  bits = [[], []]
  line.split(/[\[\]]/).each_with_index do |part, i|
    puts "  #{i} #{part}"
    bits[i%2] << part
  end
  part_twos = bits[1].join('#')

  bits[0].each do |str|
    (str.length-2).times do |i|
      str[i,3].scan(match).each do |m|
puts m.inspect
        return true if m[1] != m[2] && /#{m[2] + m[1] + m[2]}/ =~ part_twos
      end
    end
  end

  false
end

count = 0
input.each do |line|
  if good_match line
    puts "      Yes"
    count = count + 1
  else
    puts "      No"
  end
  puts "####"
end

puts "Count: #{count}"
