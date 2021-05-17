# frozen_string_literal: true

RSpec.describe 'Static pages' do
  describe 'GET show' do
    let(:test_page) { instance_double(StaticPage, content: 'Static test content') }

    before do
      allow(StaticPage).to receive(:find_by!).with(path: 'test-page').and_return(test_page)
    end

    it 'is successful' do
      get '/test-page'

      expect(response).to be_successful
    end
  end
end
