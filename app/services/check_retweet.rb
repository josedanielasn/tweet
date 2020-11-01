class CheckRetweet
  def initialize(post)
    @post = post
  end

  def is_a_retweet?
    @post.retwit_id != nil
  end

  def get_user
    return User.find(@post.owner_id) if is_a_retweet?()
    @post.user
  end
end
