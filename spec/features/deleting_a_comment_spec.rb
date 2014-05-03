require 'spec_helper'

feature 'Deleting a comment' do
   let!(:post) { create(:post) }
   let!(:comment) { create(:comment, post: post) }
   let!(:comment2) { create(:comment, post: post) }
 
   
  scenario "Deleting a comment" do
    # navigate to the post that is set up for the test
    # click link to delete one of the comments
     visit posts_path
     click_link post.title
     click_link comment.author 
     click_link "Delete Comment"
     expect(page).to have_content("Comment has been deleted.")
     expect(page).to_not have_content(comment.author)
     expect(page.current_url).to eq(post_url(post))


    
    # assert that Comment.count decreased by 1

    # assert that we're back on post page

    # assert that deleted comment is gone

    # assert that other comment is still there
  end
end
