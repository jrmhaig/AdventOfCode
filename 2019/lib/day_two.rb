class DayTwo
  attr_reader :state

  def initialize *state
    @state = state
  end

  def run
    0.step(@state.size-1, 4) do |i|
      opcode = @state[i]
      break if opcode == 99
      a = @state[i+1]
      b = @state[i+2]
      c = @state[i+3]
      case opcode
      when 1
        @state[c] = @state[a] + @state[b]
      when 2
        @state[c] = @state[a] * @state[b]
      end
    end
  end
end
