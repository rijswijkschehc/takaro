# frozen_string_literal: true

RSpec.describe FlashHelper do
  describe 'render_flash_messages' do
    context 'with no flash messages present' do
      it 'returns nothing' do
        expect(helper.render_flash_messages).to be_empty
      end
    end

    context 'with a single flash message present' do
      before do
        allow(helper).to receive(:flash).and_return([['success', 'It works']])
      end

      it 'returns the flash message' do
        expect(helper.render_flash_messages)
          .to have_selector('div.alert.alert-success', text: 'It works')
      end
    end

    context 'with multiple flash messages present' do
      before do
        allow(helper).to receive(:flash).and_return(
          [[:success, 'It works'], ['danger', 'This is serious']]
        )
      end

      it 'returns the success flash messages' do
        expect(helper.render_flash_messages)
          .to have_selector('div.alert.alert-success', text: 'It works')
      end

      it 'returns the danger flash messages' do
        expect(helper.render_flash_messages)
          .to have_selector('div.alert.alert-danger', text: 'This is serious')
      end
    end

    context 'with a link in the message' do
      before do
        allow(helper)
          .to receive(:flash).and_return([['success', 'It <a>works</a>']])
      end

      it 'returns the link with the alert-link class' do
        expect(helper.render_flash_messages).to have_selector('a.alert-link')
      end
    end

    context 'with a devise "notice" flash message present' do
      before do
        allow(helper)
          .to receive(:flash).and_return([['notice', 'A devise message']])
      end

      it 'returns the flash message' do
        expect(helper.render_flash_messages)
          .to have_selector('div.alert.alert-info', text: 'A devise message')
      end
    end
  end
end
