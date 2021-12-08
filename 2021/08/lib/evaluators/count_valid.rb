module Evaluators
  class CountValid
    def call(*data) = data.compact.count
  end
end
