require 'matrix'

module AdventOfCode
  class DayTwentyOne
    def initialize *rules
      @rules = {}
      rules.each do |rule|
        input, output = rule.split(' => ')
        @rules[convert input] = convert output
      end
    end

    def convert string
      Matrix[string.split('/').map do |row|
        row.split('').map { |x| x == '.' ? 0 : 1 }
      end]
    end

    def split matrix
      n = matrix.row_count % 2 == 0 ? 2 : 3
      m = matrix.row_count / n
      output = []
      m.times do |i|
        row = []
        m.times do |j|
          row << matrix.minor(n*i, n, n*j, n)
        end
        output << row
      end
      output
    end

    def join matrices
      Matrix.vstack(*matrices.map do |row|
        Matrix.hstack(*row)
      end)
    end

    def transform matrix
      
    end
  end
end
