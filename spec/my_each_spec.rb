# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Array do
  subject(:array) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_each' do
    it 'matches #each' do
      my_each_results = []

      array.my_each do |element|
        my_each_results << element
      end

      expect(my_each_results).to eq(array.each.to_a)
    end
  end
end
