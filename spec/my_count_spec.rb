# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }
  subject(:enumerable_hash) { {:one => 1, :two => 2} }

  describe '#my_count' do
    context 'when not given a block' do
      it 'returns the size of the enumerable' do
        expect(enumerable.my_count).to eq enumerable.size
      end
    end

    context 'when given a block' do
      it 'returns the count of the elements that satisfy the condition' do
        expect(enumerable.my_count { |value| value > 5 }).to eq 4
        expect(enumerable.my_count { |value| value <= 5 }).to eq 5
        expect(enumerable.my_count { |value| value == 5 }).to eq 1
      end
    end

    context 'when applied to hash given a block' do
      it 'returns count of elements that satisfy condition' do
        expect(enumerable_hash.my_count { |k, v| v > 1 }).to eq 1
      end
    end

    context 'when applied to hash given no block' do
      it 'returns count of elements that satisfy condition' do
        expect(enumerable_hash.my_count).to eq enumerable_hash.size
      end
    end
  end
end
