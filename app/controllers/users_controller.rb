class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    # byebug
    @posts = ArrangePost.new(@user).call
    @is_following = current_user.followed_users.find_by(id: params[:id]) 
    @reposts = current_user.reposts
  end

  def follow
    @user = User.find(params[:user_id])
    return @follows = @user.followers if params[:follow] == 'followers'
    @follows = @user.followed_users
  end

  def newFollower
    FollowUser.new(params[:user_id], current_user).call
    go_back
  end

  def destroy
    current_user.destroy
    sign_out_and_redirect(current_user)
  end
end
