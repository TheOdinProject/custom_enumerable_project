# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_all?' do
    context 'when all elements match the condition' do
      it 'returns true' do
        expect(enumerable.my_all? { |value| value > 0 }).to eq true
      end
    end

    context 'when any element does not match the condition' do
      it 'returns false' do
        expect(enumerable.my_all? { |value| value < 5 }).to eq false
      end
    end
  end
end
