# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_inject' do
    it 'reduces an enumerable to a single value' do
      initial_value = 0
      # calculates the sum of the elements of the enumerable array
      expect(enumerable.my_inject(initial_value) { |sum, value| sum + value }).to eq 88
    end

    it 'can be used to calculate the product' do
      product = enumerable.my_inject(1) { |prod, value| prod * value }

      expect(product).to eq 2_227_680
    end

    it 'uses the initial value on the first iteration' do
      initial_value = 100

      # calculates the sum of the elements of the enumerable array plus the initial value
      expect(enumerable.my_inject(initial_value) { |sum, value| sum + value }).to eq 188
    end
  end
end
