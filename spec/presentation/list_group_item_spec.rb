# frozen_string_literal: true

RSpec.describe ListGroupItem do
  let(:options) { { actionable: false, active: false, disabled: false, flavor: nil } }
  let(:list_group_item) { described_class.new(content: 'foo', path: nil, options: options) }

  describe '#html' do
    it 'generates basic Bootstrap list group item' do
      expect(list_group_item.html).to(
        have_tag('li', with: { class: 'list-group-item' }, text: 'foo')
      )
    end

    context 'with actionable set to true' do
      let(:options) { super().merge(actionable: true) }
      let(:list_group_item) { described_class.new(content: 'foo', path: '/', options: options) }

      it 'generates an actionable Bootstrap list group item' do
        expect(list_group_item.html).to(
          have_tag('a', with: { href: '/', class: 'list-group-item-action' })
        )
      end
    end

    context 'with active set to true' do
      let(:options) { super().merge(active: true) }

      it 'generates a Bootstrap list group item with active class' do
        expect(list_group_item.html).to(
          have_tag('li', with: { class: 'active' })
        )
      end
    end

    context 'with disabled set to true' do
      let(:options) { super().merge(disabled: true) }

      it 'generates a Bootstrap list group item with disabled class' do
        expect(list_group_item.html).to(
          have_tag('li', with: { class: 'disabled' })
        )
      end
    end

    context 'with a flavor set' do
      let(:options) { super().merge(flavor: :primary) }

      it 'generates a Bootstrap list group item with a flavor class' do
        expect(list_group_item.html).to(
          have_tag('li', with: { class: 'list-group-item-primary' })
        )
      end
    end
  end
end
