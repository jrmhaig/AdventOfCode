require 'beam_head'
require 'matrix'
require 'pry'

class Contraption
  def initialize(*data)
    @data = data
    @x_range = (0..@data.first.length-1)
    @y_range = (0..@data.length-1)
  end

  def illuminate(entry:, direction:)
    @illuminated = []
    beams = [transform(BeamHead.new(entry, direction))].flatten
    until beams.empty?
      beams.map! do |beam|
        beam.position += beam.direction
        if in_grid?(*beam.position)
          transform(beam)
        else
          nil
        end
      end
      beams.flatten!
      beams.compact!
    end
    @illuminated.count
  end

  def travel(beam)
    new_beams = [BeamHead.new(beam.position + beam.direction, beam.direction)]
    return [] unless @x_range.include?(new_beams.first.position[0])
    return [] unless @y_range.include?(new_beams.first.position[1])

    new_beams.first.reflect(at(*new_beams.first.position)) if ['/', '\\'].include?(at(*new_beams.first.position))
    if split(new_beams.first)
      new_beams << new_beams.first.dup
      new_beams[0].reflect('/')
      new_beams[1].reflect('\\')
    end

    new_beams
  end

  def at(x, y) = @data[y][x]
  def split(beam) = beam.direction[0].abs == 1 ? at(*beam.position) == '|' : at(*beam.position) == '-'

  private
  def in_grid?(x, y) = @x_range.include?(x) && @y_range.include?(y)
  def transform(beam)
    beams_out = [beam]
    if ['/', '\\'].include?(at(*beam.position))
      beam.reflect(at(*beam.position))
    elsif split(beam)
      new_beam = beam.dup
      return nil if @illuminated.include?(beam.position)

      beam.reflect('/')
      new_beam.reflect('\\')
      beams_out = [beam, new_beam]
    end
    @illuminated << beam.position
    @illuminated.uniq!
    beams_out
  end
end
