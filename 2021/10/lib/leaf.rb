require 'base_chunk'

class Leaf < BaseChunk
  def initialize(open, close)
    @open = open
    @close = close
  end

  def corrupt_score
    return nil if closed?

    CORRUPT_SCORES[@close]
  end

  def completer_string = @close.to_s == '' ? COMPLETER[@open] : ''
end
