require 'rails_helper'

RSpec.describe 'New User `Sign Up` Page & Existing User `Login` Page', type: :system do
  describe 'index' do
    it 'Existing User `Sign In`' do
      visit login_path
      expect(page).to have_content('Login')
    end
    it 'New User `Sign up here`' do
      visit login_path
      expect(page).to have_content('Sign up here')
    end
  end
end
