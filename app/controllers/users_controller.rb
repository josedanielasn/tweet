class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = current_user
    @posts = current_user.posts
  end

  def destroy
    current_user.destroy
    sign_out_and_redirect(current_user)
  end
end
