# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  let(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_each' do
    it 'matches #each' do
      my_each_results = []

      enumerable.my_each do |element|
        my_each_results << element
      end

      my_each_results.zip(enumerable.each) do |my_each_value, expected_value|
        expect(my_each_value).to be expected_value
      end
    end
  end
end
