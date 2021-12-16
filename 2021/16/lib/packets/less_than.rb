require 'packets/operator'

module Packets
  class LessThan < Operator
    def value = @packets.first.value < @packets.last.value ? 1 : 0
  end
end
