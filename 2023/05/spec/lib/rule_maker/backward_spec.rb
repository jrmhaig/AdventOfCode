require 'rule_maker/backward'

RSpec.describe RuleMaker::Backward do
  describe '.make' do
    subject { described_class.make(first, second, third) }

    let(:first) { 50 }
    let(:second) { 98 }
    let(:third) { 2 }

    it { is_expected.to eq({range: (50..51), offset: 48}) }
  end
end