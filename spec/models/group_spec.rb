require 'rails_helper'

RSpec.describe Group, type: :model do
  subject do
    @user = User.new(id: 1, name: 'Jon', email: 'jon@test.com', password: '123456', confirmed_at: Time.now)
    Group.new(id: 1, name: 'Group 1', icon: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test_image.jpg'), 'image/jpg'), user_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the presence of the name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'validates the presence of the icon' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'validates the user_id match' do
      expect(subject.user_id).to eq 1
    end

    it 'validates the groupp name' do
      expect(subject.name).to eq 'Group 1'
    end
  end
end
