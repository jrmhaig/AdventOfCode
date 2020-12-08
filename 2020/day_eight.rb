#!/bin/env ruby
require 'ostruct'

class State
  attr_reader :counter, :pointer

  def initialize commands
    @counter = 0
    @pointer = 0
    @commands = commands
    @used = []
  end

  def run
    while @pointer < @commands.length && execute
      if @pointer == @commands.length
        return true
      end
    end

    false
  end

  def fixed_run
    fix = false
    while execute
      hold_counter = @counter
      hold_pointer = @pointer
      hold_used = @used.dup
      execute flip: true
      return true if run

      @counter = hold_counter
      @pointer = hold_pointer
      @used = hold_used
    end
  end

  private
  def execute flip = false
    return false if @used.include? @pointer

    @used << @pointer
    command = @commands[@pointer]
    send(mangle(command.operation, flip), command.argument)
    @pointer
  end

  def acc arg
    @counter += arg
    @pointer += 1
  end

  def jmp arg
    @pointer += arg
  end

  def nop arg
    @pointer += 1
  end

  def mangle command, flip = false
    return command if !flip || command == 'acc'

    command == 'jmp' ? 'nop' : 'jmp'
  end
end

commands = File.readlines('day_eight_intput.txt').map do |data|
  split = data.split
  OpenStruct.new(operation: split[0], argument: split[1].to_i)
end

state = State.new commands
state.run
puts "1) #{state.counter}"

state = State.new commands
state.fixed_run
puts "2) #{state.counter}"
