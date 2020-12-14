#!/bin/env ruby

class Operation
  def initialize mask
    @mask = mask.split(//).map { |bit| bit == 'X' ? nil : bit }.reverse
    @commands = []
  end

  def add register, n
    @commands << { address: register, value: n }
  end

  def process registry
    @commands.each do |command|
      registry.record(command.merge(mask: @mask))
    end
  end
end

class Registry
  def initialize
    @reg = {}
  end

  def record address:, value:, mask:
    @reg[address] = masked(value, mask)
  end

  def sum
    @reg.values.sum
  end

  private
  def masked n, mask
    mask.zip(n.to_s(2).split(//).reverse).map do |pair|
      pair[0] || pair[1] || '0'
    end.reverse.join.to_i(2)
  end
end

ops = File.readlines('day_fourteen_input.txt').map(&:chomp)
  .each_with_object([]) do |line, list|
    if match = line.match(/mask = (.+)$/)
      list << Operation.new(match[1])
    elsif match = line.match(/mem\[(\d+)\] = (\d+)$/)
      list.last.add(match[1].to_i, match[2].to_i)
    end
  end

registry = ops.each_with_object(Registry.new) { |op, reg| op.process reg }
puts "1) #{registry.sum}"
