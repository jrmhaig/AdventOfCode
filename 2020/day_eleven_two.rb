#!/bin/env ruby

class Seat
  attr_reader :x, :y, :occupied, :max

  def initialize x, y, layout
    @x = x
    @y = y
    @layout = layout
    @occupied =  false
  end

  def == other
    x == other.x && y == other.y
  end

  def transition
    if @occupied
      @flip = true if neighbours >= 5
    else
      @flip = true if neighbours == 0
    end
  end

  def complete_transition
    @occupied = !@occupied if @flip
    @flip = false
  end

  def neighbours
    visible.select(&:occupied).count
  end

  def visible
    return @visible if @visible

    @visible = []
    print "\r(#{@x}, #{@y})"
    -1.upto(1).each do |x_step|
      -1.upto(1).each do |y_step|
        next if x_step == 0 and y_step == 0

        continue = true
        i = 1
        while continue && (@x + x_step*i).between?(0, @layout.width) && (@y + y_step*i).between?(0, @layout.height)
          place = @layout.places.find { |place| place.x == @x + x_step*i && place.y == @y + y_step*i }
          if place
            @visible << place
            continue = false
          end
          i += 1
        end
      end
    end

    @visible
  end
end

class Layout
  attr_reader :places, :width, :height

  def initialize rows
    @width = rows.first.length
    @height = rows.length
    @places = rows
      .map { |row| row.split(//) }
      .each_with_index.map do |row, y| 
        row.each_with_index.map do |place, x|
          Seat.new(x, y, self) if place == 'L'
        end.compact
      end.flatten
  end

  def sweep
    @places.each { |place| place.transition }
    @places.each { |place| place.complete_transition }
  end

  def occupied
    @places.select(&:occupied).count
  end
end

layout = Layout.new File.readlines('day_eleven_input.txt').map(&:chomp)
#layout = Layout.new File.readlines('day_eleven_test_input.txt').map(&:chomp)

last_count = -1
t0 = Time.now
while layout.occupied != last_count
  last_count = layout.occupied
  t = Time.now
  layout.sweep
  puts "#{layout.occupied} [#{last_count - layout.occupied}] (#{Time.now - t} seconds)"
end
puts "2) #{layout.occupied}"
puts "Overall time: #{Time.now - t0} seconds"
