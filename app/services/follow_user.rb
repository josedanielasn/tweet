module Follow
  class FollowUser 
    attr_accessor :follow_account
  
    def initialize(follow_account)
      @current_account = current_account
      @follow_account = follow_account
    end
    
    def call 
      followers = current_user.followed_users
      if followers.find(@follow_account)
        followers << @follow_account
      else
        followers.followed_users.delete(@followed_account)
      end
    end
  end
end
