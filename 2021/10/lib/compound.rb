require 'base_chunk'

class Compound < BaseChunk
  def initialize(open)
    @open = open
    @close = nil
    @subchunks = []

    yield self if block_given?
  end

  def append(chunk)
    @subchunks << chunk
  end

  def corrupt_score
    @subchunks.map(&:corrupt_score).compact.first ||
      (closed? ? nil : CORRUPT_SCORES[@close])
  end

  def completer_string
    @subchunks.map(&:completer_string).join +
      (@close.nil? ? COMPLETER[@open] : '')
  end
end
