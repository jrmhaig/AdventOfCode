#!/bin/env ruby

class Rule
  attr_reader :name

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
  attr_reader :numbers

  def initialize numbers:, rules:
    @numbers = numbers.split("\n").last.split(',').map(&:to_i)
    @rules = rules
  end

  def find_invalid
    @numbers.reject { |n| possible_rules_for(n).any? }
  end

  def valid?
    find_invalid.empty?
  end

  def possible_rules
    @numbers.map { |n| possible_rules_for n }
  end

  private
  def possible_rules_for n
    @rules.map { |rule| rule.valid?(n) ? rule : nil }.compact
  end
end

rules, my_ticket_line, other_tickets = File.read('day_sixteen_input.txt').chomp.split("\n\n")

rules = rules.split("\n").map! { |rule| Rule.new rule }
tickets = other_tickets.split("\n")[1..].map do |ticket|
  Ticket.new numbers: ticket, rules: rules
end
puts "1) #{tickets.map { |ticket| ticket.find_invalid.sum }.sum}"

valid_tickets = tickets.select {  |ticket| ticket.valid? }

my_ticket = Ticket.new(numbers: my_ticket_line, rules: rules)

possible = my_ticket.possible_rules
valid_tickets.each do |ticket|
  possible = possible.zip(ticket.possible_rules).map { |a, b| a & b }
end

while possible.map(&:count).max > 1
  singles = possible.select { |rs| rs.count == 1 }.flatten
  possible.map! do |rs|
    rs.count == 1 ? rs : rs - singles
  end
end

puts "2) #{my_ticket.numbers.map.with_index do |n, i|
  possible[i].first.name =~ /^departure/ ? n : 1
end.inject(&:*)}"
