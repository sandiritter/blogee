require 'spec_helper'

feature "User Login" do
  let!(:user) { create(:user) }
  
  before do
    visit login_path
  end
  
  feature "with username" do
    before do
      fill_in "Username", with: user.username
    end
     scenario "enters valid with username" do
       fill_in "Password", with: user.password
       click_button "Login"
       expect(page).to have_content("Welcome #{user.username}")
     end
     scenario "enters invalid with username" do
       fill_in "Password", with: user.password.reverse
       click_button "Login"
       expect(page).to have_content("Login error")
     end
  end
    
  feature "with email" do
    before do
      fill_in "Username", with: user.email
    end
    scenario "enters valid with email" do
       fill_in "Password", with: user.password
       click_button "Login"
       expect(page).to have_content("Welcome #{user.username}")
    end
    
    scenario "enters invalid with username" do
      fill_in "Password", with: user.password.reverse
      click_button "Login"
      expect(page).to have_content("Login error")
    end
  end
end