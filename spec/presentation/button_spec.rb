# frozen_string_literal: true

RSpec.describe Button do
  let(:options) { { flavor: :primary, outline: false, size: nil } }
  let(:button) { described_class.new(content: 'foo', path: nil, options: options) }

  describe '#html' do
    it 'generates basic Bootstrap button html' do
      expect(button.html).to(
        have_tag('button', with: { type: 'button', class: %w[btn btn-primary] }, text: 'foo')
      )
    end

    context 'with a target' do
      let(:options) { super().merge(remote: true) }

      it 'generates a Bootstrap button with data-target and data-remote attributes' do
        expect(button.html).to(
          have_tag('button', with: { 'data-remote': 'true' })
        )
      end
    end

    context 'with a method' do
      let(:options) { super().merge(method: :delete) }

      it 'generates a Bootstrap button with data-method and rel attributes' do
        expect(button.html).to(
          have_tag('button', with: { 'data-method': 'delete', rel: 'nofollow' })
        )
      end
    end

    context 'with a flavor' do
      let(:options) { super().merge(flavor: :secondary) }

      it 'generates a Bootstrap button with an alternative flavor class' do
        expect(button.html).to(
          have_tag('button', with: { class: 'btn-secondary' })
        )
      end
    end

    context 'with an outline' do
      let(:options) { super().merge(outline: true) }

      it 'generates a Bootstrap button with an -outline- class' do
        expect(button.html).to(
          have_tag('button', with: { class: 'btn-outline-primary' })
        )
      end
    end

    context 'with a valid alternative size' do
      let(:options) { super().merge(size: :sm) }

      it 'generates a Bootstrap button with a btn-sm class' do
        expect(button.html).to(
          have_tag('button', with: { class: 'btn-sm' })
        )
      end
    end
  end
end
