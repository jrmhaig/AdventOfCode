#!/usr/bin/env ruby

require 'time'

records = File.read('day_four_input.txt').split(/\n/).sort do |a, b|
  Time.parse(a.match(/\[(.*)\]/).captures[0]) <=> Time.parse(b.match(/\[(.*)\]/).captures[0])
end

t1 = Time.now
snooze = {}

guard = nil
next_sleep = nil
records.each do |record|
  if record.match(/Guard #(\d+) begins shift/)
    guard = $1
    snooze[guard] = {} if snooze[guard].nil?
  elsif record.match(/:(\d\d)\] falls asleep/)
    next_sleep = $1.to_i
  elsif record.match(/:(\d\d)\] wakes up/)
    next_sleep.upto($1.to_i - 1) do |i|
      snooze[guard][i] = snooze[guard][i].to_i + 1
    end
  end
end

last = snooze.sort_by { |guard, snoozes| snoozes.values.sum }.last
minute = last[1].sort_by { |minute, count| count }.last[0]
t2 = Time.now

puts "Part one: #{last[0].to_i * minute}"


snooze = 60.times.map { |i| [i, {}] }.to_h
guard = nil
next_sleep = nil
records.each do |record|
  if record.match(/Guard #(\d+) begins shift/)
    guard = $1
  elsif record.match(/:(\d\d)\] falls asleep/)
    next_sleep = $1.to_i
  elsif record.match(/:(\d\d)\] wakes up/)
    next_sleep.upto($1.to_i - 1) do |i|
      snooze[i][guard] = snooze[i][guard].to_i + 1
    end
  end
end

last = snooze.each_pair.map { |minute, counts|
  [minute, counts.values.max]
}.sort { |a, b|
  a[1].to_i <=> b[1].to_i
}.last
guard = snooze[last[0]].sort { |a, b| a[1].to_i <=> b[1].to_i }.last.first.to_i

puts "Part two: #{last[0] * guard}" 
t3 = Time.now
puts "Part one time: #{t2 - t1} seconds"
puts "Part two time: #{t3 - t2} seconds"
