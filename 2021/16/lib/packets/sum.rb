require 'packets/operator'

module Packets
  class Sum < Operator
    def value = @packets.sum(&:value)
  end
end
