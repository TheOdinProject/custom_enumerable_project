# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Array do
  subject(:array) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_each' do
    context 'when given a block' do
      it 'returns the original array' do
        my_each_results = array.my_each do |_element|
          # This should return the original array
          # no matter the contents of the block
        end

        expect(my_each_results).to eq(array)
      end

      it 'executes the block for each element' do
        my_each_results = []
        each_results = []

        array.my_each do |element|
          my_each_results << element * 2
        end

        array.each do |element|
          each_results << element * 2
        end

        expect(my_each_results).to eq(each_results)
      end
    end
  end
end
