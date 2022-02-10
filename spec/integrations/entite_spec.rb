require 'rails_helper'

RSpec.feature 'Entite Index Page', type: :feature do
  before(:each) do
    visit new_user_session_path

    fill_in 'Email', with: 'contact@maej.dev'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  describe 'GET /transactions' do
    it 'should see list of category' do
      visit transactions_path
      expect(page).to have_content 'TRANSACTIONS'
    end
  end
end
