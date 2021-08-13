# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_map' do
    let(:double_value) do
      proc { |value| value * 2 }
    end

    # Start by running these tests where map only needs to take a block
    context 'when given a block' do
      it 'returns an array by yielding to the block' do
        expect(enumerable.my_map { |value| value * 2 }).to eq([2, 2, 4, 6, 10, 16, 26, 42, 68])
      end

      it 'returns an array with the same size as the enumerable' do
        expect(enumerable.my_map { |value| value * 2 }.size).to eq enumerable.size
      end
    end

    # Update map to take a proc instead.
    # Then, unskip these tests by changing xcontext to context
    # and skip the 'when given a block' tests by changing context to xcontext
    xcontext 'when given a proc' do
      it 'returns an array by calling the proc' do
        expect(enumerable.my_map(double_value)).to eq([2, 2, 4, 6, 10, 16, 26, 42, 68])
      end

      it 'returns an array with the same size as the enumerable' do
        expect(enumerable.my_map(double_value).size).to eq enumerable.size
      end
    end

    # Update map to take either a block and/or a proc
    # and unskip all of the tests
    xcontext 'when given a block and a proc' do
      it 'returns the mapped array only executing the proc' do
        expect(enumerable.my_map(double_value) { |value| value * 3 })
          .to eq([2, 2, 4, 6, 10, 16, 26, 42, 68])
      end
    end
  end
end
