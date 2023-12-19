require 'beam_head'
require 'matrix'

class Contraption
  def initialize(*data)
    @data = data
    @x_range = (0..@data.first.length-1)
    @y_range = (0..@data.length-1)
  end

  def travel(beam)
    new_beams = [BeamHead.new(beam.position + beam.direction, beam.direction)]
    return [] unless @x_range.include?(new_beams.first.position[0])
    return [] unless @y_range.include?(new_beams.first.position[1])

    new_beams.first.reflect(at(new_beams.first.position)) if ['/', '\\'].include?(at(new_beams.first.position))
    if split(new_beams.first)
      new_beams << new_beams.first.dup
      new_beams[0].reflect('/')
      new_beams[1].reflect('\\')
    end

    new_beams
  end

  def at(position) = @data[position[1]][position[0]]

  private

  def split(beam) = beam.direction[0].abs == 1 ? at(beam.position) == '|' : at(beam.position) == '-'
end
