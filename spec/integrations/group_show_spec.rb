require 'rails_helper'

RSpec.feature 'Group show page', type: :feature do
  before(:each) do
    visit new_user_session_path

    @user = User.create!(id: 1, name: 'Jon', email: 'jon@test.com', password: '123456', confirmed_at: Time.now)
    @group = Group.create!(name: 'Group 1', icon: Rack::Test::UploadedFile.new(Rails.root.join('spec/support/test_image.jpg'), 'image/jpg'), user_id: @user.id)

    fill_in 'Email', with: 'contact@maej.dev'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
    visit single_group_path(@group)
  end

  describe 'GET /group/:id/transactions' do
    scenario 'should see details of the category' do
      expect(page).to have_content(@group.name)
      expect(page).to have_content('DETAILS')
    end
  end
end
