module Scan
  def self.find(line)
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
