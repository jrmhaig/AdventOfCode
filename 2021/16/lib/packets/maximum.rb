require 'packets/operator'

module Packets
  class Maximum < Operator
    def value = @packets.map(&:value).max
  end
end
