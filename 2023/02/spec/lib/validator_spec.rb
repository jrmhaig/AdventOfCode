require 'validator'
require 'subset'

RSpec.describe Validator do
  subject(:validator) { described_class.new(red:, green:, blue:) }

  let(:red) { 12 }
  let(:green) { 13 }
  let(:blue) { 14 }

  describe '#call' do
    subject { validator.check(*subsets) }

    context 'with subsets within the valid numbers' do
      let(:subsets) do
        [
          Subset.new('1 blue, 2 green'),
          Subset.new('3 green, 4 blue, 1 red'),
          Subset.new('1 green, 1 blue')
        ]
      end

      it { is_expected.to be_truthy }
    end

    context 'with subsets on the edge of the bounds' do
      let(:subsets) do
        [
          Subset.new("#{blue} blue, 2 green"),
          Subset.new("3 green, 4 blue, #{red} red"),
          Subset.new("#{green} green, 1 blue")
        ]
      end

      it { is_expected.to be_truthy }
    end

    context 'with a red out of bounds' do
      let(:subsets) do
        [
          Subset.new("3 green, 4 blue, #{red + 1} red"),
        ]
      end

      it { is_expected.to be_falsey }
    end

    context 'with a green out of bounds' do
      let(:subsets) do
        [
          Subset.new("#{green + 1} green, 4 blue, 1 red"),
        ]
      end

      it { is_expected.to be_falsey }
    end

    context 'with a red out of bounds' do
      let(:subsets) do
        [
          Subset.new("3 green, #{blue + 1} blue, 1 red"),
        ]
      end

      it { is_expected.to be_falsey }
    end
  end
end
