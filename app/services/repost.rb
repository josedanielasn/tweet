class Repost
  attr_accessor :post, :current_user
  def initialize(post, current_user)
    @post = post
    @current_user = current_user
  end

  def call
    reposts = current_user.reposts
    if reposts.find_by(id: post.id) == nil
      reposts << post
    else
      reposts.delete(post)
    end
  end
end
