require 'matrix'

module AdventOfCode
  module DayThree

    MOVES = {
      '^' => Vector[ 1,  0],
      'v' => Vector[-1,  0],
      '>' => Vector[ 0,  1],
      '<' => Vector[ 0, -1],
    }

require 'pry'
    def self.house_count pattern, santas: 1
      pos = []
      visited = []
      santas.times do |i|
        pos[i] = Vector[0, 0]
        visited[i] = { pos[i] => 1 }
      end
      n = 0
      pattern.split(//).each do |m|
        pos[n] += MOVES[m]
        if visited[n].key?(pos[n])
          visited[n][pos[n]] += 1
        else
          visited[n][pos[n]] = 1
        end
        n = (n + 1) % santas
      end
      visited.inject([]) do |collection, list|
        collection += list.keys
        collection.uniq
      end.count
    end
  end
end
