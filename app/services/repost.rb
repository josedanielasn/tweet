class Repost
  attr_accessor :post, :current_user
  def initialize(post, current_user)
    @post = post
    @current_user = current_user
  end

  def call
    user_posts = current_user.posts
    find_if_retweeted = user_posts.find_by(retwit_id: @post.id)
    if @post.retwit_id == nil && find_if_retweeted == nil
      user_posts.create(message: @post.message, retwit_id: @post.id, owner_id: @post.user.id)
    elsif @post.retwit_id != nil 
      @post.destroy
    elsif  find_if_retweeted != nil
      find_if_retweeted.destroy
    end
  end
end
