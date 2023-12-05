require 'rule_maker/forward'

RSpec.describe RuleMaker::Forward do
  describe '.make' do
    subject { described_class.make(first, second, third) }

    let(:first) { 50 }
    let(:second) { 98 }
    let(:third) { 2 }

    it { is_expected.to eq({range: (98..99), offset: -48}) }
  end
end