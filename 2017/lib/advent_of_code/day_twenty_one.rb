require 'matrix'

module AdventOfCode
  class DayTwentyOne
    attr_reader :pattern

    def initialize *rules
      @rules = {}
      rules.each do |rule|
        input, output = rule.split(' => ')
        @rules[convert input] = convert output
      end
      @pattern = Matrix[
        [0, 1, 0],
        [0, 0, 1],
        [1, 1, 1]
      ]
    end

    def step
      @pattern = join(split(@pattern).map do |row|
        row.map { |m| transform m }
      end)
    end

    def convert string
      Matrix[*string.split('/').map do |row|
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
      test_matrix = matrix.dup
      n = test_matrix.row_count
      2.times do # Flip
        test_matrix = Matrix[*n.times.map do |i|
                               test_matrix.row(n-i-1)
                             end]
        4.times do # Rotate
          test_matrix = Matrix[*n.times.map do |i|
                                 test_matrix.column(n-i-1)
                               end]
          return @rules[test_matrix] if @rules.keys.include? test_matrix
        end
      end
    end
  end
end
