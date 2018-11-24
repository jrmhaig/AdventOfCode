module AdventOfCode
  module DayTwo
    def self.one_present l, w, h
      sides = [l*w, w*h, h*l]
      2 * sides.sum + sides.min
    end

    def self.all_presents *dimensions
      dimensions.map do |dimension|
        self.one_present *dimension.split('x').map(&:to_i)
      end.sum
    end

    def self.ribbons *edges
      2 * edges.min(2).sum + edges.inject(&:*)
    end

    def self.all_ribbons *dimensions
      dimensions.map do |dimension|
        self.ribbons *dimension.split('x').map(&:to_i)
      end.sum
    end
  end
end
