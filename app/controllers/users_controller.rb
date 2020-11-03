class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    @is_following = current_user.followed_users.find_by(id: params[:id]) 
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

  def mention
    Notify.new(current_user).remove_notify_mentions
    @posts = Notify.new(current_user).all_post_mentions
  end

  def destroy
    current_user.destroy
    sign_out_and_redirect(current_user)
  end

end
