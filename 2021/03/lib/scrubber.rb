require 'sub_state'

class Scrubber
  def initialize(lines:, &block)
    @lines = lines.dup
    @block = block
  end

  def call
    @lines.first.length.times do |i|
      state = SubState.new
      @lines.each { |line| state.accept(line) }
      bit = state.at(i, &@block)
      @lines.select! { |line| line[i] == bit }
      return @lines.first.to_i(2) if @lines.length <= 1
    end
  end
end
