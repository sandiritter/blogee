require 'spec_helper'

feature "Viewing comments" do
   #let!(:post) { FactoryGirl.create(:post) }
  # let!(:comment) { FactoryGirl.create(:comment, post: post) }
  post_1 = FactoryGirl.create(:post, title: "The postest with the mostest", content: "More is less and less is more", author: "Sally")
  FactoryGirl.create(:comment, post: post_1, content: "I couldn't agree more.", author: "Tasha")  
 
  cd before do
    # setup everything you need - in this case, probably a good idea to set up
    # two Posts, each with 1 Comment
   visit posts_path
   click_link post.title
    
  end

  scenario do
    # navigate to Post you want to check

    # assert that you'll find the comment (author and content) associated with post to which you navigated

    # assert that you did not find comment associated with the other post
  end

end
