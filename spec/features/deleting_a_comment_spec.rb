require 'spec_helper'

feature 'Deleting a comment' do
   let!(:post) { FactoryGirl.create(:post) }
   let!(:comment) { FactoryGirl.create(:comment, post: post) }
  
   before do
     #visit '/'
     click_link post.title
     click_link comment.author
   end
  
  scenario "Deleting a comment" do
    # navigate to the post that is set up for the test
    # click link to delete one of the comments
     click_link "Delete Comment"
     expect(page).to have_content("Comment has been deleted.")
     expect(page.current_url).to eq(post_url(post))


    
    # assert that Comment.count decreased by 1

    # assert that we're back on post page

    # assert that deleted comment is gone

    # assert that other comment is still there
  end
end
