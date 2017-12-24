module AdventOfCode
  class DayTwentyFour
    attr_reader :all

    def initialize *pairs
      @pairs = pairs.map { |p| p.split('/').map(&:to_i) }
      @all = gather_pairs(0, @pairs)
    end

    def strongest including = :all
      longest = @all.map(&:count).max

      @all.select do |bridge|
        including == :all || bridge.count == longest
      end.map do |bridge|
        bridge.map(&:sum).sum if (including == :all || bridge.count == longest)
      end.max
    end

    private

    def gather_pairs n, pairs
      pairs.select { |pair| pair.include? n }.inject([]) do |output, root|
        output << [root]

        # Make sure duplicats are not deleted
        m = (root-[n])[0] || n
        next_pairs = pairs.dup
        next_pairs.delete_at pairs.index root

        gather_pairs(m, next_pairs).each do |rest|
          output << [root] + rest
        end
        output
      end
    end
  end
end
