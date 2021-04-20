require 'rails_helper'

RSpec.describe 'index', type: :system do
  describe 'index' do
    it 'shows past events' do
      visit events_path
      expect(page).to have_content('Past events')
    end
    it 'shows upcoming events' do
      visit events_path
      expect(page).to have_content('Upcoming events')
    end
  end
end
