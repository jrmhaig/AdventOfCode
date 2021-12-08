module Evaluators
  class Concat
    def call(*data) = data.map(&:to_s).join.to_i
  end
end
