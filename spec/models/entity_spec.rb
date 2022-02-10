require 'rails_helper'

RSpec.describe Entite, type: :model do
  subject do
    @user = User.new(id: 1, name: 'Jon', email: 'jon@test.com', password: '123456', confirmed_at: Time.now)
    @group = Group.new(id: 1, name: 'Group 1', icon: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test_image.jpg'), 'image/jpg'), user_id: @user.id)
    Entite.new(name: 'Transaction 0001', amount: 12.0, group_id: @group.id, user_id: @user.id)
  end

  describe 'validation tests' do
    it 'validates the presence of the name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'validates the presence of the amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end

    it 'validates the user_id match' do
      expect(subject.user_id).to eq 1
    end

    it 'validates the group_id match' do
      expect(subject.group_id).to eq 1
    end

    it 'validates the transaction id match' do
      expect(subject.name).to eq 'Transaction 0001'
    end

    it 'validates the amount match' do
      expect(subject.amount).to eq 12.0
    end
  end
end
