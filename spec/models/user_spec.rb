require_relative 'rails_helper'
require_relative 'app\models\user'

RSpec.describe User, type: :model do
  describe 'A user can be created' do
    let(:name) { 'simple name' }

    it 'user is valid if it has name' do
      user = User.create(name: 'username')
      expect(user).to be_valid
    end

    it 'user is not valid if name is not present' do
      user = User.create
      expect(user).to_not be_valid
    end

    it 'validation error for missing name on user' do
      user = User.create(name: nil)
      user.validate
      expect(user.errors[:name]).to include("can't be blank")
    end
  end
end