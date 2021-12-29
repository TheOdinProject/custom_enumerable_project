# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_map' do
    context 'when given a block' do
      it 'returns an array by yielding to the block' do
        expect(enumerable.my_map { |value| value * 2 }).to eq([2, 2, 4, 6, 10, 16, 26, 42, 68])
      end

      it 'returns an array with the same size as the enumerable' do
        expect(enumerable.my_map { |value| value * 2 }.size).to eq enumerable.size
      end
    end

    context 'when called with &:symbol' do
      it 'returns an array calling the method that matches the symbol for each element' do
        expect(enumerable.my_map(&:odd?)).to eq([true, true, false, true, true, false, true, true, false])
      end
    end
  end
end
