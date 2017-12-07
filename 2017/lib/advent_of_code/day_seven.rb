module AdventOfCode
  class DaySeven
    def initialize *data
      @data = {}
      @programs = []
      data.each do |line|
        if (match = /(\S+)\s+\((\d+)\)(.*)$/.match(line))
          @data[match[1]] = {
            weight: match[2].to_i
          }
          if submatch = /\s*-> (.+)$/.match(match[3])
            @data[match[1]][:children] = submatch[1].split(/,\s*/)
            @programs += submatch[1].split(/,\s*/)
          end
        end
      end
      @programs.uniq!
    end

    def base
      (@data.keys - @programs).first
    end
  end
end
