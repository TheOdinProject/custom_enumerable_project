# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_each' do
    it 'matches #each' do
      my_each_results = []

      enumerable.my_each do |element|
        my_each_results << element
      end

      expect(my_each_results).to eq(enumerable.each.to_a)
    end
  end
end
