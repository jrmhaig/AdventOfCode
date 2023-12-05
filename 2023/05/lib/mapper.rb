class Mapper
  def initialize(*rules, following:, rule_maker:)
    @rules = rules.map { |rule| rule_maker.make(*rule) }
    @following = following
  end

  def map(n)
    return apply_rule(n) if @following.nil?

    @following.map(apply_rule(n))
  end

  private

  def apply_rule(n)
    n + find_rule(n)[:offset]
  end

  def find_rule(n)
    @rules.find { |rule| rule[:range].include?(n) } || { offset: 0 }
  end
end
