require 'packets/operator'

module Packets
  class GreaterThan < Operator
    def value = @packets.first.value > @packets.last.value ? 1 : 0
  end
end
