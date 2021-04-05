# frozen_string_literal: true

RSpec.describe Badge do
  let(:badge) { described_class.new(content: 'foo') }

  describe '#html' do
    it 'generates a bg-secondary Bootstrap badge html' do
      expect(badge.html).to(
        have_tag('span', with: { class: %w[badge bg-secondary] }, text: 'foo')
      )
    end

    context 'with a flavor' do
      let(:options) { { flavor: :primary } }
      let(:badge) { described_class.new(content: 'foo', options: options) }

      it 'generates a Bootstrap badge with an alternative flavor class' do
        expect(badge.html).to(
          have_tag('span', with: { class: %w[badge bg-primary] })
        )
      end
    end
  end
end
