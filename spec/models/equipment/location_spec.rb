# frozen_string_literal: true

RSpec.describe Equipment::Location do
  describe 'instance' do
    context 'with a "/" in the name' do
      let(:location) { described_class.new(name: 'foo / bar') }

      it 'is invalid' do
        expect(location).to be_invalid
      end
    end
  end
end
