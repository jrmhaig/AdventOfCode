require 'packets/operator'

module Packets
  class Minimum < Operator
    def value = @packets.map(&:value).min
  end
end
