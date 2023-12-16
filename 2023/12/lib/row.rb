class Row
  attr_reader :springs, :groups

  def initialize(springs, *groups)
    @springs = springs
    @groups = groups
  end

  def arrangements
    return 0 if @springs.nil?
    return single_group_arrangement if @groups.length == 1

    0.upto(@springs.length - @groups.first).take_while { |i| i == 0 || @springs[i-1] != '#' }.sum do |i|
      if @springs[i, @groups.first].index('.') || (i > 0 && @springs[i-1] == '#') || (i + @groups.first < @springs.length && @springs[i + @groups.first] == '#')
        0
      else
        Row.new(@springs[i+@groups.first+1..], *@groups[1..]).arrangements
      end
    end
  end

  private

  def single_group_arrangement
    blocks = @springs.split(/\.+/).select { |block| block.match(/#/) }
    if blocks.count == 0
      # No 'broken' blocks
      arrangements_with_unknown_only
    elsif blocks.count > 1
      # Too many block
      0
    elsif blocks.first.length < @groups.first
      # Not enough known broken
      0
    elsif blocks.first.count('#') > @groups.first
      # Too many known broken
      0
    else
      full_block = blocks.first
      before = full_block.index('#')
      if full_block.index('#', before + @groups.first)
        # Broken springs are too far apart
        0
      else
        broken_block = full_block.count('#') == 1 ? '#' : full_block.match(/(#[\?#]*#)/)
        after = full_block.length - before - broken_block.to_s.length
        short = @groups.first - broken_block.to_s.length
        if before < short && after < short
          (before + after + broken_block.to_s.length) - @groups.first + 1
        else
          [before, after, short].min + 1
        end
      end
    end
  end

  def arrangements_with_unknown_only
    @springs.count('?')
    groups = @springs.split(/\.+/).select { |group| group.length >= @groups.first }
    groups.sum { |group| group.length - @groups.first + 1 }
  end
end
