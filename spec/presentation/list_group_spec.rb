# frozen_string_literal: true

RSpec.describe ListGroup do
  let(:options) { {} }
  let(:list_group) { described_class.new(items: [], options: options) }

  describe '#html' do
    it 'generates a basic Bootstrap list group' do
      expect(list_group.html).to(
        have_tag('ul', with: { class: %w[list-group] })
      )
    end

    context 'with actionable set to true' do
      let(:options) { super().merge(actionable: true) }

      it 'generates a div Bootstrap list group' do
        expect(list_group.html).to(
          have_tag('div')
        )
      end
    end

    context 'with flush set to true' do
      let(:options) { super().merge(flush: true) }

      it 'generates a div Bootstrap list group' do
        expect(list_group.html).to(
          have_tag('ul', with: { class: 'list-group-flush' })
        )
      end
    end
  end
end
