
class ArrangePost
  attr_accessor  :current_account

  def initialize(current_account)
    @current_account = current_account
  end

  def call
    all_posts = user_posts_reposts
    parsed_posts = parse_each_user(all_posts)
    parsed_posts
  end

  def user_posts_reposts
    all_posts = (@current_account.posts + @current_account.retweets).flatten.sort_by(&:created_at).reverse
    all_posts
  end

  def parse_each_user(all_posts)
    parsed_posts = all_posts.map do |x|
      if x.class.name != "Retweet"
        {post: x, reposter: "original"}
      else
        {post: Post.find(x.repost_id), reposter: User.find(x.reposter_id)}
      end
    end
    parsed_posts
  end
end
