#!/bin/env ruby

class Rule
  def initialize line
    @name, range_string = line.split(':')
    @bounds = range_string.gsub(/\s+/, '').split(/[^\d]+/).map(&:to_i).each_slice(2)
    #@ranges = [(bounds[0]..bounds[1]), (bounds[2]..bounds[3])]
  end

  def valid? n
    @bounds.map { |pair| n.between?(*pair) }.lazy.any?(true)
  end
end

class Ticket
  def initialize numbers:, rules:
    @numbers = numbers.split("\n").last.split(',').map(&:to_i)
    @rules = rules
  end

  def find_invalid
    @numbers.reject { |n| check_rules n }
  end

  private
  def check_rules n
    @rules.map { |rule| rule.valid? n }.lazy.any?(true)
  end
end

rules, my_ticket, other_tickets = File.read('day_sixteen_input.txt').chomp.split("\n\n")
#rules, my_ticket, other_tickets = File.read('day_sixteen_test_input.txt').chomp.split("\n\n")

rules = rules.split("\n").map! { |rule| Rule.new rule }
tickets = other_tickets.split("\n")[1..].map do |ticket|
  Ticket.new numbers: ticket, rules: rules
end
puts "1) #{tickets.map { |ticket| ticket.find_invalid.sum }.sum}"
