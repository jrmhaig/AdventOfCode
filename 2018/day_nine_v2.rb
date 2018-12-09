#!/usr/bin/env ruby

class Link
  attr_accessor :forward, :backward, :value

  def initialize value, forward = nil, backward = nil
    @value = value
    if forward
      @forward = forward
      forward.backward = self
    else
      @forward = self
    end
    if backward
      @backward = backward
      backward.forward = self
    else
      @backward = self
    end
  end
end

def play marbles, players
  pointer = Link.new 0
  scores = Array.new(players, 0)

  1.upto(marbles) do |i|
    if i % 23 == 0
      pointer = pointer
        .backward
        .backward
        .backward
        .backward
        .backward
        .backward
      scores[i % players] += i + pointer.backward.value
      pointer.backward.backward.forward = pointer
      pointer.backward = pointer.backward.backward
    else
      pointer = Link.new i, pointer.forward.forward, pointer.forward
    end
  end

  scores.max
end

t1 = Time.now
puts "Part one: #{play(71144, 424)}"
t2 = Time.now
puts "Part two: #{play(7114400, 424)}"
t3 = Time.now
puts "Part one time: #{t2 - t1} seconds"
puts "Part two time: #{t3 - t2} seconds"
