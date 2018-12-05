#!/usr/bin/env ruby

polymer = File.read('day_five_input.txt').chomp

t1 = Time.now

def reduce polymer
  len = polymer.length + 1
  while len > polymer.length
    len = polymer.length
    (len - 2).downto(0) do |i|
      if (polymer[i].ord - polymer[i+1].ord).abs == 32
        polymer = polymer[0,i] + polymer[i+2..-1]
      end
    end
  end
  polymer
end

puts "Day one: #{reduce(polymer).length}"
t2 = Time.now

polymer2 = reduce polymer
min = polymer2.length
('a'..'z').each do |l|
  min = [min, reduce(polymer2.gsub(/[#{l}#{l.upcase}]/, '')).length].min
end
puts "Day two: #{min}"

t3 = Time.now
puts "Day one time: #{t2 - t1} seconds"
puts "Day two time: #{t3 - t2} seconds"
