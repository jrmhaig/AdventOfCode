#!/bin/env ruby

class Bag
  attr_reader :description, :contents, :contains
  attr_writer :others

  def initialize data
    @description, contents = data.gsub(/ bags?/, '').split(/ contain /)
    @contents = contents.tr('.', '').split(', ')
      .map { |bag| parse_bag bag }
      .compact
      .to_h
  end

  def has? search
    (@contents.keys & search).any?
  end

  def contains
    @contents.inject(0) { |n, (bag, i)| n + i * (1 + @others[bag].contains) }
  end

  private
  def parse_bag bag
    return nil if bag == 'no other'

    match = bag.match(/(\d+) (.+)/)
    [ match[2], match[1].to_i ]
  end
end

bags = File.readlines('day_seven_input.txt').map { |data| Bag.new(data.chomp) }

remainder = bags
search = ['shiny gold']
while search
  split = remainder.group_by { |bag| bag.has? search }
  remainder = split[false]
  search = split[true]&.map(&:description)
end
puts "1) #{bags.count - remainder.count}"

labelled_bags = bags.map { |bag| [bag.description, bag] }.to_h
bags.each { |bag| bag.others = labelled_bags }
puts "2) #{labelled_bags['shiny gold'].contains}"
