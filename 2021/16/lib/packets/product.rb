require 'packets/operator'

module Packets
  class Product < Operator
    def value = @packets.map(&:value).inject(&:*)
  end
end
