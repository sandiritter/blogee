





2.  Have an ability to publish a post
...
  save button, save and publish
  publish -> posts#publish


3.  Only signed in user can see drafts

scope :published, -> { where (date: !nil) }   


def index
  if !current_user
      @posts = Post.published
    # sameas Post.published
  else
    @posts = Post.all
    #sameas Post.all
  end
end
