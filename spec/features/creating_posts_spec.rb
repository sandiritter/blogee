require 'spec_helper'

feature 'new post only available to logged in users' do
  let!(:user) {create :user}
  
  before do
    visit new_post_path
  end
  
  scenario 'logged in' do
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    expect(current_path).to eq(new_post_path)
  end

  scenario 'unauthenticated' do
    expect(current_path).to eq(login_path)
    expect(page).to have_content("You must login")
  end
end

feature 'Creating posts' do
 let!(:user) {create :user}
  
  scenario 'with valid attributes' do
    # visit the posts path in the browser
   visit posts_path
    # find a link titled new post and click it
    click_link 'New Post'
    message = "You must login"
    expect(page).to have_content(message)
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    # find the text field called Title and fill it in with the text
    fill_in 'Title', with: 'My First Post'
    # find the text field called Content and fill it in with the text
   fill_in 'Content', with: 'Lorem ipsum dolor sit amet.'
    # find the text field called Author and fill it in with the text

    # find the button called Save and click it
    click_button 'Save'
    # Assert that there is now 1 post stored in the database
    expect(Post.count).to eq 1
    # load the last post from the database for assertions
    post = Post.last
    # assert the browsers current path to be the given path
    expect(current_path).to eq post_path(post)
    # assert that the posts title is correct
    expect(post.title).to eq 'My First Post'
   # within "#title #author" do
   #  expect(page).to have_content("by: #{user.username}")
   #end
  end

 scenario 'with invalid attributes' do
    # visit the posts path in the browser
    visit posts_path
    # find a link titled New Post and click it
    click_link 'New Post'
    # find the button called Save and click it
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    click_button 'Save'
    # assert that we are still on the form
    expect(current_path).to eq new_post_path
    # assert that we are getting the error flash
    expect(page).to have_css('.alert.alert-danger')
  end
  
  scenario "Creating a post with an attachment" do
    visit posts_path
    click_link 'New Post'

    ### IF YOU HAVE Authentication in place
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
   #click_link 'New Post'
    ### END if authentication in place

    fill_in 'Title', with: 'My First Post'
    fill_in 'Content', with: 'Lorem ipsum dolor sit amet.'

    attach_file "File", "spec/fixtures/test.jpg"
    click_button "Save"

    expect(page).to have_content("My First Post")

    within("#asset") do
      expect(page).to have_content("test.jpg")
    end 
  end
  
  scenario "Creating a post with tags" do
  visit posts_path
  click_link 'New Post'

  fill_in "Username", with: user.username
  fill_in "Password", with: user.password
  click_button "Login"
  

  fill_in 'Title', with: 'My First Post'
  fill_in 'Content', with: 'Lorem ipsum dolor sit amet.'
    fill_in "Tag names", with: "browser visual"
  click_button "Save"

    within("#tag_names") do
    expect(page).to have_content("browser")
    expect(page).to have_content("visual")
  end
end
  
end  
  
