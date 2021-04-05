# frozen_string_literal: true

RSpec.describe ButtonHelper do
  describe 'button' do
    before do
      allow(Button).to receive(:new)
        .with(content: 'foo', path: '/', options: {})
        .and_return(instance_double(Button, html: ''))

      helper.button(content: 'foo', path: '/')
    end

    it 'delegates to Bootstrap::Button' do
      expect(Button).to have_received(:new).with(content: 'foo', path: '/', options: {})
    end
  end

  describe 'button_group' do
    before do
      allow(ButtonGroup).to receive(:new)
        .with(items: [], options: {})
        .and_return(instance_double(ButtonGroup, html: ''))

      helper.button_group(items: [])
    end

    it 'delegates to Bootstrap::ButtonGroup' do
      expect(ButtonGroup).to have_received(:new).with(items: [], options: {})
    end
  end
end
