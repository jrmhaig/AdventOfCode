#!/bin/env ruby

class State
  DIRECTIONS = [:e, :s, :w, :n]

  def initialize
    @direction = 0
    @x = @y = 0
  end

  def n a; @y += a; end
  def s a; @y -= a; end
  def e a; @x += a; end
  def w a; @x -= a; end
  def f a; send(DIRECTIONS[@direction], a); end

  def l a; @direction = (@direction - a/90) % 4; end
  def r a; @direction = (@direction + a/90) % 4; end

  def manhattan
    @x.abs + @y.abs
  end
end

instructions = File.readlines('day_twelve_input.txt').map(&:chomp)
  .map do |command|
    command.match(/^(.)(\d+)$/)[1,2]
  end

state = instructions.each_with_object(State.new) { |opp, s| s.send(opp[0].downcase.to_sym, opp[1].to_i) }
puts "1) #{state.manhattan}"
