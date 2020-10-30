class MentionLink 
  attr_accessor :message
  def initialize(message)
    @message = message
  end

  def call
    users = @message.split.map do |word|
      if word.include?('@') && user = User.find_by(username: word.delete('@'))
        "<a href = '/users/#{user.id}'>@#{user.username}</a>"
      else
        word
      end
    end
    users.join(' ')
  end
end


