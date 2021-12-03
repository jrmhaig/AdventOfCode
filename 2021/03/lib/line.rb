class Line
  def initialize(binary)
    @data = binary.split(//)
  end

  def update_state(state)
    @data.each_with_index do |value, i|
      state.report[i] ||= 0
      state.report[i] += value == '1' ? 1 : -1
    end
  end
end
