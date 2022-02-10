require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Jon', email: 'jon@test.com', password: '123456', confirmed_at: Time.now)
  end

  describe 'validation tests' do
    it 'validates the presence of the name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'validates the presence of the email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'validates the user name match' do
      expect(@user.name).to eq 'Jon'
    end

    it 'validates the user email match' do
      expect(@user.email).to eq 'jon@test.com'
    end
  end
end
