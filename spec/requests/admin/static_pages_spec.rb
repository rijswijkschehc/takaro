# frozen_string_literal: true

RSpec.describe 'Static pages' do
  before do
    sign_in(create(:admin))
  end

  describe 'GET index' do
    it 'is successful' do
      get '/admin/static_pages'

      expect(response).to be_successful
    end
  end

  describe 'GET new' do
    it 'is successful' do
      get '/admin/static_pages/new'

      expect(response).to be_successful
    end
  end
end
