class Wrapper
  COMPLETER_SCORES = {
    ')' => 1,
    ']' => 2,
    '}' => 3,
    '>' => 4
  }.freeze

  def initialize
    @subchunks = []

    yield self if block_given?
  end

  def append(chunk)
    @subchunks << chunk
  end

  def corrupt_score
    @subchunks.map(&:corrupt_score).compact.first
  end

  def complete_score
    completer_string.split(//).inject(0) do |n, b|
      n * 5 + COMPLETER_SCORES[b].to_i
    end
  end

  def completer_string
    @subchunks.map(&:completer_string).join
  end
end
