require 'racer'

RSpec.describe Racer do
  subject(:racer) { Racer.new(time, distance) }

  describe '#winners' do
    subject { racer.winners }

    context 'with the first example' do
      let(:time) { 7 }
      let(:distance) { 9 }

      it { is_expected.to contain_exactly(2, 3, 4, 5) }
    end

    context 'with the second example' do
      let(:time) { 15 }
      let(:distance) { 40 }

      it { is_expected.to contain_exactly(4, 5, 6, 7, 8, 9, 10, 11) }
    end

    context 'with the third example' do
      let(:time) { 30 }
      let(:distance) { 200 }

      it { is_expected.to contain_exactly(11, 12, 13, 14, 15, 16, 17, 18, 19) }
    end
  end
end

