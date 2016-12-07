#!/usr/bin/env ruby

input = File.read('input_day_4.txt').split(/\n/)
alphabet = Array('a'..'z')

total = 0
input.each do |line|
  counts = {}
  /^(.+)-(\d*)\[(.....)\]/ =~ line
  code = $1
  val = $2.to_i
  sum = $3
  code.split(//).each do |c|
    if (c >= 'a' && c <= 'z')
      counts[c] = (counts.has_key?(c) ? counts[c] : 0) + 1
    end
  end
  keys = counts.keys.sort{|a, b| [counts[b], a] <=> [counts[a], b]}
  check = keys[0,5].join('')
  if sum == check
    cypher = Hash[alphabet.zip(alphabet.rotate(val % 26))]
    code.split(//).each do |c|
      print c == '-' ? ' ' : cypher[c]
    end
    print " - sector #{val}\n"
  end
end
