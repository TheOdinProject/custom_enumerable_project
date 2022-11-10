# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_inject' do
    context 'when it receives a symbol' do
      it 'combines the operands using the method' do
        expect(enumerable.my_inject(:-)).to eq(-86)
      end
    end

    context 'when it receives an initial_operand and a symbol' do
      it 'uses the initial value on the first iteration and combines the operands using the method' do
        expect(enumerable.my_inject(88, :-)).to be_zero
      end
    end

    context 'when it receives a block' do
      it 'passes each operand to the block' do
        expect(enumerable.my_inject { |memo, operand| memo + operand }).to eq 88
      end
    end

    context 'when it receives an initial_operand and a block' do
      it 'sums the elements of the enumerable array' do
        expect(enumerable.my_inject(0) { |sum, value| sum + value }).to eq 88
      end

      it 'multiplies the elements of the enumerable array' do
        product = enumerable.my_inject(1) { |prod, value| prod * value }

        expect(product).to eq 2_227_680
      end

      it 'uses the initial value on the first iteration' do
        # calculates the sum of the elements of the enumerable array plus the initial value
        expect(enumerable.my_inject(100) { |sum, value| sum + value }).to eq 188
      end
    end
  end
end
