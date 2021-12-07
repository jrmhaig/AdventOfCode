module Calculation
  class Incremental
    def call(x, y)
      n = (x - y).abs
      n * (n + 1) / 2
    end
  end
end
