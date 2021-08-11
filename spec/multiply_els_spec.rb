# frozen_string_literal: true

require_relative '../lib/multiply_els'

RSpec.describe 'multiply_els' do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }

  it 'returns the product of all of the elements' do
    expect(multiply_els(enumerable)).to eq 2_227_680
  end
end
