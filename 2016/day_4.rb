#!/usr/bin/env ruby

input = File.read('input_day_4.txt').split(/\n/)

total = 0
input.each do |line|
  counts = {}
  /^(.+)-(\d*)\[(.....)\]/ =~ line
  code = $1
  val = $2
  sum = $3
  code.split(//).each do |c|
    if (c >= 'a' && c <= 'z')
      counts[c] = (counts.has_key?(c) ? counts[c] : 0) + 1
    end
  end
  keys = counts.keys.sort{|a, b| [counts[b], a] <=> [counts[a], b]}
  puts line
  puts "  #{code} #{sum}"
  keys.each do |k|
    puts "    #{k}: #{counts[k]}"
  end
  check = keys[0,5].join('')
  puts "    #{sum} -- #{check}"
  total = total + val.to_i if sum == check
end

puts "Answer: #{total}"
