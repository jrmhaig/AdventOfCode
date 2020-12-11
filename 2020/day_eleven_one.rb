#!/bin/env ruby

class Space
  attr_reader :x, :y, :occupied

  def initialize x, y
    @x = x
    @y = y
    @occupied = false
  end

  def == other
    x == other.x && y == other.y
  end
end

class OccupiedSeat < Space
  def initialize *args
    super
    @occupied =  true
  end

  def transition layout 
    return if layout.neighbours(@x, @y) >= 4

    self
  end
end

class Floor < Space
  def transition layout
    self
  end
end

class Layout
  attr_reader :places

  def initialize rows
    @width = rows.first.length
    @height = rows.length
    @places = rows
      .map { |row| row.split(//) }
      .each_with_index.map do |row, y| 
        row.each_with_index.map do |place, x|
          Floor.new(x,y) if place == '.'
          # place == '.' ? Floor.new(x, y) : AvailableSeat.new(x, y)
        end.compact
      end.flatten
  end

  def sweep
    new_places = []
    @width.times do |x|
      @height.times do |y|
        place = @places.select { |p| p.x == x && p.y == y }.first
        if place.nil?
          new_places << OccupiedSeat.new(x, y) if neighbours(x, y) == 0
        else
          new_places << place.transition(self)
        end
      end
    end
    @places = new_places.compact
  end

  def occupied
    @places.select(&:occupied).count
  end

  def neighbours x, y
    @places.select do |place|
      !(place.x == x && place.y == y) &&
        place.x.between?(x-1, x+1) &&
        place.y.between?(y-1, y+1) &&
        place.occupied
    end.count
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
puts "1) #{layout.occupied}"
puts "Overall time: #{Time.now - t0} seconds"
