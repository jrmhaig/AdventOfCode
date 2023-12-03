require 'part'

class Engine
  def initialize(*data, scanner:)
    @parts = data.each_with_index.each_with_object([]) do |(row, i), pts|
      scanner.find(row).each do |part|
        start = part[0]
        length = part[1] - part[0] + 1
        above = i > 0 ? data[i - 1][start, length] : nil
        below = i < data.length - 1 ? data[i + 1][start, length] : nil
        pts << Part.new(row[start, length], above:, below:)
      end
    end
  end

  def sum = @parts.reject { |part| part.symbols.empty? }.sum(&:number)
end
