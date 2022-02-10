require 'rails_helper'

RSpec.feature 'Group Index Page', type: :feature do
  before(:each) do
    visit new_user_session_path

    fill_in 'Email', with: 'contact@maej.dev'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  describe 'GET /group' do
    it 'should see list of category' do
      visit group_path
      expect(page).to have_content 'CATEGORY'
    end
  end
end
