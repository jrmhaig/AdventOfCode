#!/bin/env ruby

class Password
  def initialize data
    match = data.match /(\d*)-(\d*) (.): (.*)/
    @rule_min = match[1].to_i
    @rule_max = match[2].to_i
    @rule_letter = match[3]
    @password = match[4]
  end

  def valid?
    @password.split('').tally[@rule_letter]&.between?(@rule_min, @rule_max)
  end

  def new_valid?
    [@password[@rule_min - 1], @password[@rule_max - 1]].tally[@rule_letter] == 1
  end
end

passwords = File.read('day_two_input.txt').split("\n")
  .map { |line| Password.new(line) }

puts "Part one: #{passwords.select { |pw| pw.valid? }.count}"
puts "Part two: #{passwords.select { |pw| pw.new_valid? }.count}"
