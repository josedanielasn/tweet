
  class FollowUser 
    attr_accessor :follow_account
  
    def initialize(follow_account, current_user)
      @current_account = current_user
      # byebug
      @follow_account = User.find(follow_account)
    end
    
    def call 
      followed_users = @current_account.followed_users
      # byebug
      if followed_users.find_by(id: @follow_account.id) == nil
        followed_users << @follow_account
      else
        followed_users.delete(@follow_account)
      end
    end
  end

