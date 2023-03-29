# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }
  subject(:enumerable_hash) { {:one => 1, :two => 2} }

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

    it 'works with hash' do
      expect(enumerable_hash.my_inject(0) { |sum, (k, v)| sum + v }).to eq 3 
    end 

    it 'works with hash to build new hash' do
      expect(enumerable_hash.my_inject(Hash.new(0)) do |hash, (k, v)|
        hash[k] += 1
        hash
      end
      ).to eq({:one => 1, :two => 1})
    end
  end
end
