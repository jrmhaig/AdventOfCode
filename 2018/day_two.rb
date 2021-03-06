#!/usr/bin/env ruby

LETTERS = ('a'..'z').freeze
ids = File.read('day_two_input.txt').split(/\n/)

t1 = Time.now

def find_duplicates id, j
  LETTERS.select { |l| id.count(l) == j }.empty? ? 0 : 1
end

checksum = ids.inject([0,0]) { |ns, id|
             ns.map.with_index { |n, i| n + find_duplicates(id, i+2) }
           }.inject(:*)

puts "Part one: #{checksum}"

letters = ('a'..'z')
ids = File.read('day_two_input.txt').split(/\n/)

t1 = Time.now

twos = 0
threes = 0
ids.each do |id|
  twos += 1 unless letters.select { |l| id.count(l) == 2 }.empty?
  threes += 1 unless letters.select { |l| id.count(l) == 3 }.empty?
end
puts "Part one: #{twos*threes}"

t2 = Time.now

found = nil
ids[0].length.times do |i|
  found = ids.map { |id| id[0,i] + id[i+1..-1] }
            .group_by { |id| id }
            .select { |key, value| value.size > 1 }
            .map(&:first).first
  break if found
end
puts "Part two: #{found}"
t3 = Time.now

puts "Part one time: #{t2-t1} seconds"
puts "Part two time: #{t3-t2} seconds"
