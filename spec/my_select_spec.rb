# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_select' do
    it 'returns only the values that match the condition' do
      expect(enumerable.my_select { |value| value > 10 }).to eq([13, 21, 34])
    end

    it 'filters values that do not match the condition' do
      expect(enumerable.my_select { |value| value > 10 }).not_to include(1, 2, 3, 5, 8)
    end

    context 'when no items match the condition' do
      it 'returns an empty array' do
        expect(enumerable.my_select { |value| value > 40 }).to eq([])
      end
    end
  end
end
