# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }
  subject(:enumerable_hash) { {:one => 1, :two => 2} }

  describe '#my_select' do
    it 'returns only the values that match the condition' do
      expect(enumerable.my_select { |value| value > 10 }).to eq([13, 21, 34])
    end

    it 'filters values that do not match the condition' do
      expect(enumerable.my_select { |value| value > 10 }).not_to include(1, 2, 3, 5, 8)
    end

    context 'when no items match the condition' do
      it 'returns an empty array' do
        expect(enumerable.my_select { |value| value > 40 }).to eq([])
      end
    end

    context 'when applied to hash with entries that match condition' do
      it 'returns only values that match the condition' do
        expect(enumerable_hash.my_select { |k, v| v > 1 }).to eq({:two => 2})
      end
    end
  end
end
