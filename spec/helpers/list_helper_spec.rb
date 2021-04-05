# frozen_string_literal: true

RSpec.describe ListHelper do
  describe 'list_group_item' do
    before do
      allow(ListGroupItem).to receive(:new)
        .with(content: 'foo', path: '/', options: {})
        .and_return(instance_double(ListGroupItem, html: ''))

      helper.list_group_item(content: 'foo', path: '/')
    end

    it 'delegates to Bootstrap::ListGroupItem' do
      expect(ListGroupItem).to have_received(:new).with(content: 'foo', path: '/', options: {})
    end
  end

  describe 'list_group' do
    before do
      allow(ListGroup).to receive(:new)
        .with(items: [], options: {})
        .and_return(instance_double(ListGroup, html: ''))

      helper.list_group(items: [])
    end

    it 'delegates to Bootstrap::ListGroup' do
      expect(ListGroup).to have_received(:new).with(items: [], options: {})
    end
  end
end
