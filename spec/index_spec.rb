require 'rails_helper'

RSpec.describe 'index', type: :system do
  describe 'index' do
    it 'shows past events' do
      visit events_path
      expect(page).to have_content('Past Events')
    end
    it 'shows upcoming events' do
      visit events_path
      expect(page).to have_content('Upcoming Events')
    end
    it 'Needs to Login to Attend Events' do
      visit events_path
      expect(page).to_not have_content('Enroll')
    end
  end
end
