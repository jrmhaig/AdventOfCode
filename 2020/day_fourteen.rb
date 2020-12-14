#!/bin/env ruby

class Operation
  def initialize mask
    @mask = mask
    @commands = []
  end

  def add register, n
    @commands << { address: register, value: n }
  end

  def process registry
    registry.mask = @mask
    @commands.each do |command|
      registry.record command
    end
  end
end

class Registry
  attr_reader :reg

  def initialize recorder
    @reg = {}
    @recorder = recorder
  end

  def mask= m
    @recorder.set_mask m
  end

  def record address:, value:
    @recorder.call(self, address: address, value: value)
  end

  def sum
    @reg.values.sum
  end
end

class PartOneRecord
  def call registry, address:, value:
    registry.reg[address] = masked(value)
  end

  def set_mask mask
    @mask = mask.split(//).map { |bit| bit == 'X' ? nil : bit }.reverse
  end

  private
  def masked n
    @mask.zip(n.to_s(2).split(//).reverse).map do |pair|
      pair[0] ||  pair[1] || '0'
    end.reverse.join.to_i(2)
  end
end

class PartTwoRecord
  def call registry, address:, value:
    masked_addresses(address).each do |add|
      registry.reg[add] = value
    end
  end

  def set_mask mask
    @mask = mask.split(//).reverse
  end

  private
  def masked_addresses n
    masked_address = [0]
    @mask.zip(n.to_s(2).split(//).reverse).each_with_index do |pair, i|
      masked_address.map! do |add|
        case pair[0]
        when '0'
          add + pair[1].to_i*2**i
        when '1'
          add + 2**i
        when 'X'
          [add, add + 2**i]
        end
      end.flatten!
    end

    masked_address
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

registry = Registry.new(PartOneRecord.new)
registry = ops.each_with_object(registry) { |op, reg| op.process reg }
puts "1) #{registry.sum}"
registry = Registry.new(PartTwoRecord.new)
registry = ops.each_with_object(registry) { |op, reg| op.process reg }
puts "2) #{registry.sum}"
