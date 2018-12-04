#!/usr/bin/env ruby

require 'time'

records = File.read('day_four_input.txt').split(/\n/).sort do |a, b|
  Time.parse(a.match(/\[(.*)\]/).captures[0]) <=> Time.parse(b.match(/\[(.*)\]/).captures[0])
end

snooze = {}

guard = nil
next_sleep = nil
records.each do |record|
  puts record
  if record.match(/Guard #(\d+) begins shift/)
    guard = $1
    snooze[guard] = {} if snooze[guard].nil?
  elsif record.match(/:(\d\d)\] falls asleep/)
    next_sleep = $1.to_i
  elsif record.match(/:(\d\d)\] wakes up/)
    puts " #{next_sleep} up to #{$1.to_i - 1}"
    next_sleep.upto($1.to_i - 1) do |i|
      snooze[guard][i] = snooze[guard][i].to_i + 1
    end
  end
end

pp snooze.sort_by { |guard, snoozes| snoozes.values.sum }
last = snooze.sort_by { |guard, snoozes| snoozes.values.sum }.last

puts "Part one: #{last[0].to_i * last[1].values.max}"
