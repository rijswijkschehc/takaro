# frozen_string_literal: true

RSpec.describe NavHelper do
  describe 'navbar_toggler' do
    it 'renders the navbar toggler' do
      expect(helper.navbar_toggler(target: '#foo')).to have_tag(:button)
    end
  end
end
