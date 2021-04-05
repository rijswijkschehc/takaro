# frozen_string_literal: true

RSpec.describe ButtonGroup do
  let(:options) { {} }
  let(:button_group) { described_class.new(items: [], options: options) }

  describe '#html' do
    it 'generates a basic Bootstrap button group' do
      expect(button_group.html).to(
        have_tag('div', with: { class: 'btn-group', role: 'group' })
      )
    end

    context 'with a valid alternative size' do
      let(:options) { super().merge(size: :sm) }

      it 'renders a small Bootstrap button group' do
        expect(button_group.html).to(
          have_tag('div', with: { class: 'btn-group-sm' })
        )
      end
    end
  end
end
