# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  describe '#my_map' do
    it 'returns an array with the results of running the given block for every element' do
      expect(enumerable.my_map { |value| value * 2 }).to eq([2, 2, 4, 6, 10, 16, 26, 42, 68])
    end

    it 'returns an array with the same size as the enumerable' do
      expect(enumerable.my_map { |value| value * 2 }.size).to eq enumerable.size
    end
  end
end