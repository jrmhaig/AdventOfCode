require 'advent_of_code/day_seven'

RSpec.describe AdventOfCode::DaySeven do
  let(:tree) {
    AdventOfCode::DaySeven.new(
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
  }
  describe '#base' do
    it 'satisfies the example' do
      expect(tree.base).to eq 'tknk'
    end
  end

  describe '#weight' do
    it 'gets the correct weight for ugml' do
      expect(tree.weight('ugml')).to eq 251
    end

    it 'gets the correct weight for padx' do
      expect(tree.weight('padx')).to eq 243
    end

    it 'gets the correct weight for fwft' do
      expect(tree.weight('fwft')).to eq 243
    end
  end

  describe '#find_error' do
    it 'returns the correct weight for the error' do
      expect(tree.find_error(tree.base)).to eq 60
    end
  end
end
