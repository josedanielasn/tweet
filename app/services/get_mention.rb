class GetMention
  def initialize(message, post)
    @message = message
    @post = post
  end

  def call
    users = @message.scan(/@(\w+)/).flatten.uniq
    return array_of_users(users) if !users.empty?
  end

  def array_of_users(users)
    users.each do |user|
      user_exist = User.find_by(username: user)
      if user_exist 
        user_exist.notifications.create(type_notif:"mention", event_id: @post.id)
      else
        return
      end
    end
  end

end
