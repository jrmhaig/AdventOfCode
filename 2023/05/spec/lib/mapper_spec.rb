require 'mapper'

RSpec.describe Mapper do
  subject(:mapper) { described_class.new(*rules, following:, rule_maker:) }

  let(:following) { instance_double(described_class) }
  let(:rule_maker) { RuleMaker::Forward }

  describe '#map' do
    subject(:map) { mapper.map(number) }

    let(:rules) do
      [
        [50, 98, 2],
        [52, 50, 48]
      ]
    end

    context 'with a following rule' do
      before do
        allow(following).to receive(:map).and_return(99)
      end

      context 'with a number that is not mapped to a different number' do
        let(:number) { 45 }

        it do
          map
          expect(following).to have_received(:map).with(45)
        end

        it { is_expected.to eq 99 }
      end

      context 'with a number that is mapped to a different number' do
        let(:number) { 55 }

        it do
          map
          expect(following).to have_received(:map).with(57)
        end

        it { is_expected.to eq 99 }
      end
    end

    context 'with no following rule' do
      let(:following) { nil }

      context 'with a number that is not mapped to a different number' do
        let(:number) { 45 }

        it { is_expected.to eq 45 }
      end

      context 'with a number that is mapped to a different number' do
        let(:number) { 55 }

        it { is_expected.to eq 57 }
      end
    end
  end
end
