class GetMention
  def initialize(message)
    @message = message
  end

  def call
    users = @message.scan(/@(\w+)/).flatten.uniq
    !users.empty? ? array_of_users(users) : []
  end

  def array_of_users(users)
    mentioned_users = users.map do |user|
      user_exist = User.find_by(username: user)
      user_exist ? user_exist : return
    end
    mentioned_users
  end

end
