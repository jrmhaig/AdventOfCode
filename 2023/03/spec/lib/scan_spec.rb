require 'scan'

RSpec.describe Scan do
  describe '#find' do
    subject { Scan.find(line) }

    context 'with numbers not on the edge' do
      let(:line) { '.467..11...633.' }

      it { is_expected.to eq([[0, 4], [5, 8], [10, 14]]) }
    end

    context 'with numbers on the edge' do
      let(:line) { '467...11....633' }

      it { is_expected.to eq([[0, 3], [5, 8], [11, 14]]) }
    end
  end
end
