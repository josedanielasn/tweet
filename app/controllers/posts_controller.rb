class PostsController < ApplicationController

  def index
    @posts = Post.all
    @post = current_user.posts.build
  end

  def show
    @post = Post.find_by(id: params[:id]) 
    return redirect_to user_path(current_user) if @post == nil
    @user = @post.user
  end

  def create
    @post = current_user.posts.build(posts_params)
    return go_back if @post.save
    render 'new'
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    go_back
  end

  private
    def posts_params
      params.require(:post).permit(:message)
    end
end
