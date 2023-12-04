require 'part'

class Scan
  def initialize(*data)
    @data = data
  end

  def call
    { parts: find_parts }
  end

  private

  def find_parts
    @data.each_with_index.each_with_object([]) do |(row, i), pts|
      find(row).each do |part|
        start = part[0]
        length = part[1] - part[0] + 1
        above = i > 0 ? @data[i - 1][start, length] : nil
        below = i < @data.length - 1 ? @data[i + 1][start, length] : nil
        pts << Part.new(row[start, length], above:, below:)
      end
    end.reject { |part| part.symbols.empty? }
  end

  def find(line)
    line.split(//).each_with_index.each_with_object([]) do |(char, i), result|
      if result.last && result.last.length < 2
        result.last << i unless char.match(/\d/)
      else
        result << [[0, i - 1].max] if char.match(/\d/)
      end
    end.tap do |result|
      result.last << line.length - 1 if result.last && result.last.length < 2
    end    
  end
end
