require 'forwardable'

class Line
  extend Forwardable

  def_delegators :@line, :length, :to_i, :[]

  def initialize(binary)
    @line = binary
  end

  def update_state(state)
    @line.split(//).each_with_index do |value, i|
      state.report[i] ||= 0
      state.report[i] += value == '1' ? 1 : -1
    end
  end
end
