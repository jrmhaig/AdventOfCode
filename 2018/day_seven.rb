#!/usr/bin/env ruby

t1 = Time.now

rules = File.read('day_seven_input.txt')
  .split(/\n/)
  .map { |rule|
    rule
      .match(/Step (.) must be finished before step (.) can begin/)
      .captures
  }

finished = []
pending = rules.flatten.uniq.sort

tasks = ''
pointer = 0

while pending.length > 0
  pending.each do |task|
    if rules.select { |r| r[1] == task }.empty?
      tasks += task
      rules.select! { |r| r[0] != task }
      pending.delete(task)
      break
    end
  end
end

puts "Part one: #{tasks}"
t2 = Time.now

example = <<~RULES
Step C must be finished before step A can begin.
Step C must be finished before step F can begin.
Step A must be finished before step B can begin.
Step A must be finished before step D can begin.
Step B must be finished before step E can begin.
Step D must be finished before step E can begin.
Step F must be finished before step E can begin.
RULES

#rules = example
rules = File.read('day_seven_input.txt')
  .split(/\n/)
  .map { |rule|
    rule
      .match(/Step (.) must be finished before step (.) can begin/)
      .captures
  }

finished = []
pending = rules.flatten.uniq.sort
available = []

pointer = 0
ttls = {}
offset = 60
workers = 5
time_taken = 0

while ttls.length > 0 || pending.length > 0
  available = pending.select do |task|
    rules.select { |r| r[1] == task }.empty?
  end
  while !available.empty? && (workers - ttls.count) > 0
    a = available.shift
    ttls[a] = offset + a.ord - 64
    pending.delete(a)
  end

  ttls = ttls
    .map { |task, ttl| [ task, ttl - 1 ] }
    .select do |ttl|
      if ttl[1] == 0
        rules.select! { |r| r[0] != ttl[0] }
        false
      else
        true
      end
    end.to_h

  time_taken += 1
end

puts "Part two: #{time_taken}"
t3 = Time.now

puts "Part one time: #{t2 - t1} seconds"
puts "Part one time: #{t3 - t2} seconds"
