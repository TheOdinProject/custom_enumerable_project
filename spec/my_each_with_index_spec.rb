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

      my_each_with_index_results.zip(enumerable.each_with_index) do |my_each_with_index_iteration_results, expected_results|
        my_each_value, my_each_index = my_each_with_index_iteration_results
        expected_value, expected_index = expected_results

        incorrect_assertion_message =
          "expected a value of #{expected_value.inspect} "\
          "and an index of #{expected_index.inspect}, "\
          "got a value of #{my_each_value.inspect} "\
          "and an index of #{my_each_index.inspect}\n"\
          "my_each_with_index_results: #{my_each_with_index_results}"

        expect(my_each_value).to be(expected_value), incorrect_assertion_message
        expect(my_each_index).to be(expected_index), incorrect_assertion_message
      end
    end
  end
end
