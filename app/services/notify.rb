class Notify
  attr_accessor :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def remove_notify_mentions
    @current_user.notifications.mention.recent_notification.each do |mention|
      mention.seen = true
      mention.save
    end
  end

  def all_post_mentions
    posts = @current_user.notifications.mention.map do |post|
      get_post = Post.find_by(id: post.event_id)
      get_post ? get_post : nil
    end
    posts.select {|post| post != nil}
  end
end
