require 'leaf'
require 'compound'

class ChunkFactory
  OPEN = ['(', '{', '[', '<']
  CLOSE = [')', '}', ']', '>']

  def chunk(input)
    if input.length < 2 || CLOSE.include?(input[1])
      open, close, remainder = input.split(//, 3)
      return Leaf.new(open, close), remainder
    else
      open, remainder = input.split(//, 2)
      compound = Compound.new(open) do |c|
        while remainder && OPEN.include?(remainder[0])
          subchunk, remainder = chunk(remainder)
          c.append(subchunk)
        end
        c.close, remainder = remainder.split(//, 2) if remainder
      end
      return compound, remainder
    end
  end
end
