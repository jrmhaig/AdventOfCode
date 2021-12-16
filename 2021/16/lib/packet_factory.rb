class PacketFactory
  def initialize(*bits)
    @bits = bits
  end

  def fetch_next
    version = @bits.shift(3).join.to_i(2)
    type = @bits.shift(3).join.to_i(2)
    if type == 4
      first_bit = 1
      value = []
      while first_bit == 1
        value += shift(5)
        first_bit = value[-5]
      end
      value += shift((4 - (value.length + 6)) % 4
      Literal.new(version: version, value: value)
    else
    
  end
end
