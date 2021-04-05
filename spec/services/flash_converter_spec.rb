# frozen_string_literal: true

RSpec.describe FlashConverter do
  describe '#messages' do
    let(:flash_converter) { described_class.new(flash: flash) }

    context 'with no flash messages present' do
      let(:flash) { [] }
      let(:messages) { [] }

      it 'returns an empty array' do
        expect(flash_converter.messages).to eq(messages)
      end
    end

    context 'with a single flash message present' do
      let(:flash) { [['success', 'It works']] }
      let(:messages) do
        [{ classes: %w[alert alert-success], content: 'It works' }]
      end

      it 'returns the single flash attributes' do
        expect(flash_converter.messages).to eq(messages)
      end
    end

    context 'with multiple flash messages present' do
      let(:flash) do
        [['success', 'It works'],
         ['danger', 'This is serious'],
         ['notice', 'Please note'],
         ['alert', 'This is serious too!']]
      end

      let(:messages) do
        [{ classes: %w[alert alert-success], content: 'It works' },
         { classes: %w[alert alert-danger], content: 'This is serious' },
         { classes: %w[alert alert-info], content: 'Please note' },
         { classes: %w[alert alert-danger], content: 'This is serious too!' }]
      end

      it "returns all flashes' attributes" do
        expect(flash_converter.messages).to eq(messages)
      end
    end

    context 'with a link in the message' do
      let(:flash) { [['success', 'It <a>works</a>']] }
      let(:messages) do
        [{ classes: %w[alert alert-success],
           content: 'It <a class="alert-link">works</a>' }]
      end

      it 'returns the link with the alert-link class' do
        expect(described_class.new(flash: flash).messages).to eql(messages)
      end
    end

    context 'with a Devise "notice" flash message present' do
      let(:flash) { [['notice', 'A Devise message']] }
      let(:messages) do
        [{ classes: %w[alert alert-info], content: 'A Devise message' }]
      end

      it 'returns the flash message' do
        expect(described_class.new(flash: flash).messages).to eq(messages)
      end
    end
  end
end
