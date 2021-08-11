# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  let(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_each_with_index' do
    it 'matches #each_with_index' do
      my_each_with_index_results = []

      enumerable.my_each_with_index do |element, index|
        my_each_with_index_results << [element, index]
      end

      expect(my_each_with_index_results).to eq (enumerable.each_with_index.to_a)
    end
  end
end
