module RuleMaker
  module Forward
    def self.make(a, b, c)
      { range: (b..b+c-1), offset: a-b }
    end
  end
end