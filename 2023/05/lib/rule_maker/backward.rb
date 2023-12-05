module RuleMaker
  module Backward
    def self.make(a, b, c)
      { range: (a..a+c-1), offset: b-a }
    end
  end
end