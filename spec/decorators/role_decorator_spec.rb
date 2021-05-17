# frozen_string_literal: true

RSpec.describe RoleDecorator do
  let(:decorator) { described_class.decorate(role) }
  let(:role) { instance_double(Role, name: 'test') }

  describe '#badge' do
    it 'renders a bootstrap badge span with the role name' do
      expect(decorator.badge).to have_selector('span.badge.bg-secondary', text: 'test')
    end
  end
end
