#!/bin/env ruby

class Cube
  attr_reader :x, :y, :z

  def initialize x:, y:, z:
    @x = x
    @y = y
    @z = z
  end
end

class Cubes
  attr_reader :count

  def initialize
    @cubes = {}
    @mins = { x: 0, y: 0, z: 0 }
    @maxs = { x: 0, y: 0, z: 0 }
    @x_min = @x_max = 0
    @y_min = @y_max = 0
    @z_min = @z_max = 0
    @count = 0
  end

  def add cube
    [:x, :y, :z].each do |coord|
      @mins[coord] = [cube.send(coord), @mins[coord]].min
      @maxs[coord] = [cube.send(coord), @maxs[coord]].max
    end
    @cubes[cube.x] ||= {}
    @cubes[cube.x][cube.y] ||= {}
    @cubes[cube.x][cube.y][cube.z] = cube
    @count += 1
  end

  def find x, y, z
    @cubes.dig(x, y, z)
  end

  def range coord
    (@mins[coord]-1).upto(@maxs[coord]+1)
  end
end

class Grid
  def initialize
    @cubes = Cubes.new
  end

  def add cube
    @cubes.add cube
  end

  def find x, y, z
    @cubes.find(x, y, z)
  end

  def sweep
    new_cubes = Cubes.new
    @cubes.range(:x).each do |i|
      @cubes.range(:y).each do |j|
        @cubes.range(:z).each do |k|
          cube = @cubes.find(i, j, k)
          if cube
            new_cubes.add(cube) if neighbours(i, j, k).between?(2, 3)
          else
            new_cubes.add(Cube.new x: i, y: j, z: k) if neighbours(i, j, k) == 3
          end
        end
      end
    end
    @cubes = new_cubes
  end

  def neighbours x, y, z
    nbs = 0
    -1.upto(1).each do |i|
      -1.upto(1).each do |j|
        -1.upto(1).each do |k|
          next if i == 0 && j == 0 && k == 0

          nbs += 1 if @cubes.find(x+i, y+j, z+k)
        end
      end
    end
    nbs
  end

  def count
    @cubes.count
  end
end

grid = Grid.new
File.readlines('day_seventeen_input.txt').each_with_index do |line, i|
  line.chomp.split(//).each_with_index do |cube, j|
    grid.add(Cube.new(x: i, y: j, z: 0)) if cube == '#'
  end
end

6.times do
  grid.sweep
end
puts "1) #{grid.count}"
