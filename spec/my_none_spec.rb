# frozen_string_literal: true

require_relative '../lib/my_enumerables'

RSpec.describe Enumerable do
  subject(:enumerable) { [1, 1, 2, 3, 5, 8, 13, 21, 34] }
  subject(:enumerable_hash) { {:one => 1, :two => 2} }

  describe '#my_none?' do
    context 'when no elements match the condition' do
      it 'returns true' do
        expect(enumerable.my_none? { |value| value < 0 }).to eq true
      end
    end

    context 'when any element matches the condition' do
      it 'returns false' do
        expect(enumerable.my_none? { |value| value == 1 }).to eq false
      end
    end

    context 'when applied to hash' do
      it 'returns false' do
        expect(enumerable_hash.my_none? { |k, v| v > 1 }).to eq false
      end
    end
  end
end
