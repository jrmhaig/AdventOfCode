require 'matrix'
require 'pp'

module AdventOfCode
  class DayTwenty
    attr_reader :particles

    def initialize *data
      @all_particles = []
      @particles = []
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
      @particles.each do |particle|
        particle[:v] = particle[:v] + particle[:a]
        particle[:p] = particle[:p] + particle[:v]
      end
    end

    def all_steady?
      @particles.each { |p| return false unless steady?(p) }
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
      candidates = m_accells.each_index.select{|i| m_accells[i] == m_accells.min }
      distances = candidates.map { |c| manhatten @particles[c] }
      candidates[distances.index(distances.min)]
    end
  end
end
