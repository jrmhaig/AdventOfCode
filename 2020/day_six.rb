#!/bin/env ruby

class Answers
  def initialize data
    @line = data.split("\n").map { |line| line.split(//) }
  end

  def yeses
    @line.inject(&:+).uniq.count
  end

  def common
    @line.inject(&:&).count
  end
end

qns = File.read('day_six_input.txt')
  .split("\n\n")
  .map { |data| Answers.new(data) }

puts "1) #{qns.map(&:yeses).sum}"
puts "2) #{qns.map(&:common).sum}"
