require 'advent_of_code/day_seven'

RSpec.describe AdventOfCode::DaySeven do
  describe '#base' do
    it 'satisfies the example' do
      tree = AdventOfCode::DaySeven.new(
        'pbga (66)',
          'xhth (57)',
          'ebii (61)',
          'havc (66)',
          'ktlj (57)',
          'fwft (72) -> ktlj, cntj, xhth',
          'qoyq (66)',
          'padx (45) -> pbga, havc, qoyq',
          'tknk (41) -> ugml, padx, fwft',
          'jptl (61)',
          'ugml (68) -> gyxo, ebii, jptl',
          'gyxo (61)',
          'cntj (57)'
      )
      expect(tree.base).to eq 'tknk'
    end
  end
end
