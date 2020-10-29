class PostFollowing 
  attr_accessor  :current_account
  def initialize(current_account)
    @current_account = current_account
  end

  def call
    all_posts = combine_all_posts_reposts
    parsed_posts = parse_each_user(all_posts)
    parsed_posts
  end

  def combine_all_posts_reposts
    following_post = @current_account.followed_users.map {|user| [user.posts, user.retweets]}
    all_posts = (@current_account.posts + following_post + @current_account.retweets).flatten.sort_by(&:created_at).reverse
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
