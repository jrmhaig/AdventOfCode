require 'engine'
require 'scan'

RSpec.describe Engine do
  subject(:engine) { described_class.new(*data, scanner: Scan) }

  let(:data) do
    [
      '467..114..',
      '...*......',
      '..35..633.',
      '......#...',
      '617*......',
      '.....+.58.',
      '..592.....',
      '......755.',
      '...$.*....',
      '.664.598..'
    ]
  end

  describe '#sum' do
    subject { engine.sum }

    it { is_expected.to eq 4361 }
  end
end
