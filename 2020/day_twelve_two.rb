#!/bin/env ruby

class State
  def initialize
    @x = @y = 0
    @waypoint_x = 10
    @waypoint_y = 1
  end

  def n a; @waypoint_y += a; end
  def s a; @waypoint_y -= a; end
  def e a; @waypoint_x += a; end
  def w a; @waypoint_x -= a; end
  def f a
    @x += a * @waypoint_x
    @y += a * @waypoint_y
  end

  def l a
    (a/90).times do
      hold = @waypoint_x
      @waypoint_x = -@waypoint_y
      @waypoint_y = hold
    end
  end

  def r a
    (a/90).times do
      hold = @waypoint_x
      @waypoint_x = @waypoint_y
      @waypoint_y = -hold
    end
  end

  def manhattan
    @x.abs + @y.abs
  end
end

instructions = File.readlines('day_twelve_input.txt').map(&:chomp)
  .map do |command|
    command.match(/^(.)(\d+)$/)[1,2]
  end

state = instructions.each_with_object(State.new) { |opp, s| s.send(opp[0].downcase.to_sym, opp[1].to_i) }
puts "2) #{state.manhattan}"
