require 'matrix'
require 'pp'

module AdventOfCode
  class DayTwenty
    attr_reader :particles, :destroyed
    attr_writer :destroy_collisions

    def initialize *data
      @all_particles = []
      @particles = []
      @destroyed = []
      @destroy_collisions = false
      data.each do |line|
        match = /p=<(.*)>, v=<(.*)>, a=<(.*)>/.match line
        @particles << {
          p: Vector[*match[1].split(/,/).map(&:to_i)],
          v: Vector[*match[2].split(/,/).map(&:to_i)],
          a: Vector[*match[3].split(/,/).map(&:to_i)]
        }
      end
    end

    def step
      positions = {}
      @particles.each_with_index do |particle, i|
        next if @destroyed.include? i
        particle[:v] = particle[:v] + particle[:a]
        particle[:p] = particle[:p] + particle[:v]
        if positions.keys.include? particle[:p]
          positions[particle[:p]] << i
        else
          positions[particle[:p]] = [i]
        end
      end

      if @destroy_collisions
        positions.values.each do |ids|
          if ids.length > 1
            @destroyed += ids
          end
        end
      end
    end

    def all_steady?
      @particles.each_with_index { |p, i| return false unless (@destroyed.include?(i) || steady?(p)) }
      true
    end

    def steady? particle
      3.times do |i|
        unless (particle[:a][i] == 0 && (particle[:v][i] <=> particle[:p][i])) ||
             (((particle[:a][i] <=> 0) == (particle[:v][i] <=> 0)) && ((particle[:a][i] <=> 0) == (particle[:p][i] <=> 0)))
          return false
        end
      end
      true
    end

    def manhatten particle, part = :p
      particle[part].map(&:abs).sum
    end

    def find_closest
      while !all_steady?
        step
      end

      m_accells = @particles.map { |p| manhatten p, :a }
      min = m_accells.max
      m_accells.each_with_index do |acc, i|
        min = [min, acc].min unless @destroyed.include? i
      end
      candidates = m_accells.each_index.select{|i| m_accells[i] == min }
      distances = candidates.map { |c| manhatten @particles[c] }
      candidates[distances.index(distances.min)]
    end
  end
end
