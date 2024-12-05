#!/usr/bin/env ruby

class Rule
  attr_reader :first, :last

  def initialize(data)
    @first, @last = data.split('|').map(&:to_i)
  end

  def valid(a, b) = !(b == @first && a == @last)
end

class Update
  attr_reader :pages

  def initialize(data)
    @pages = data.split(',').map(&:to_i)
  end

  def middle = @pages[(@pages.size-1)/2]

  def apply(rule)
    return true if @pages.find_index(rule.first).nil?

    !@pages[..@pages.find_index(rule.first)].include?(rule.last)
  end

  def sort(*rules)
    @pages = @pages.sort { |a, b| rules.map { |rule| rule.valid(a,b) }.all? ? -1 : 1 }
  end
end

rules, updates = File.read('input.txt').split("\n\n")

rules = rules.split("\n").map { |rule| Rule.new(rule) }
updates = updates.split("\n").map { |update| Update.new(update) }

valid, invalid = updates.partition { |update| rules.map { |rule| update.apply(rule) }.all? }
puts "Part 1: #{valid.sum(&:middle)}"

invalid.each { |update| update.sort(*rules) }
puts "Part 2: #{invalid.sum(&:middle)}"
