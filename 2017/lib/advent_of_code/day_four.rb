module AdventOfCode
  module DayFour
    def self.validate code, method = :advanced
      words = case method
              when :advanced
                code.split(/\s+/).map do |w|
                  w.split(//).sort.join
                end
              else
                code.split /\s+/
              end
      words.length == words.uniq.length
    end
  end
end
