class BaseChunk
  attr_accessor :open, :close

  CORRUPT_SCORES = {
    ')' => 3,
    ']' => 57,
    '}' => 1197,
    '>' => 25137
  }.freeze
  COMPLETER = {
    '(' => ')',
    '[' => ']',
    '{' => '}',
    '<' => '>'
  }.freeze

  def ==(other)
    other.is_a?(self.class) && @open == other.open && @close == other.close
  end

  private

  def closed?
    [['(', ')'], ['[', ']'], ['{', '}'], ['<', '>']].include?([@open, @close])
  end
end
