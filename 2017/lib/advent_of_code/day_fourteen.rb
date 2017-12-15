require 'advent_of_code/day_ten'

module AdventOfCode
  class DayFourteen
    def initialize code
      @data = []
      128.times do |i|
        @data << AdventOfCode::DayTen.new(
          size: 256,
          inputs: '%s-%d' % [code, i],
          rounds: 64
        ).dense.to_i(16).to_s(2).rjust(128, '0')
      end
    end

    def used
      @data.map { |line| line.scan(/1/).count }.sum
    end

    def number_of_groups
      grouped = []
      i = 1
      @data.each_with_index do |line, k|
        grouped_line = []
        grouped << grouped_line
        line.split(//).each_with_index do |b, j|
          if b == '0'
            grouped_line << 0
          else
            if j > 0 && grouped_line[j-1] > 0
              grouped_line[j] = grouped_line[j-1]
            else
              grouped_line[j] = i
              i += 1
            end
            if k > 0 && grouped[k-1][j] > 0
              l = grouped[k-1][j]
              grouped.each do |grouped_to_update|
                grouped_to_update.map! { |n| n == l ? grouped_line[j] : n }
              end
            end
          end
        end
      end
      grouped.inject([]) do |numbers, line|
        numbers += line.uniq
      end.uniq.length - 1 # -1 to exclude 0
    end
  end
end
