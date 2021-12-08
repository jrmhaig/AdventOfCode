class Decoder
  def initialize(code:, display:, evaluator:)
    @code = code
    @display = display
    @evaluator = evaluator
  end

  def evaluate
    @evaluator.call(*@code.map { |n| @display.find(n) })
  end
end
