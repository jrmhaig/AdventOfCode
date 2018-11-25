require 'digest'

module AdventOfCode
  module DayFour
    def self.find_coin key, n = 5
      zeros = '1'
      i = 0
      while zeros != '0' * n
        i += 1
        zeros = (Digest::MD5.hexdigest key + i.to_s)[0,n]
      end
      i
    end
  end
end
