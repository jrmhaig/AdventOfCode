require 'subset'

class Game
  attr_accessor :id

  def initialize(input, validator:)
    split = input.match(/Game (\d+): (.*)$/)
    @id = split[1].to_i
    @validator = validator
    @subsets =  split[2].split(/;\s*/).map { |data| Subset.new(data) }
  end

  def valid? = @validator.check(*@subsets)

  def power
    [
      @subsets.map(&:red).max,
      @subsets.map(&:blue).max,
      @subsets.map(&:green).max
    ].reduce(&:*)
  end
end
