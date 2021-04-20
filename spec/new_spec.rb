require 'rails_helper'

RSpec.describe 'New event page', type: :system do
  describe 'Create New event' do
    it 'User needs to be loged in' do
      visit new_event_path
      expect(page).to have_content('Login')
    end
  end
end
