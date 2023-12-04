require 'scan'

RSpec.describe Scan do
  subject(:scanner) { described_class.new(*data) }

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

  describe '#call' do
    subject(:result) { scanner.call }

    it { expect(result[:parts].length).to eq 8 }

    it { expect(result[:parts].map(&:number)).to contain_exactly(467, 35, 633, 617, 592, 664, 755, 598) }
  end
end
