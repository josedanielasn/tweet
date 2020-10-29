class PostsController < ApplicationController

  def index
    @posts = PostFollowing.new(current_user).call
    @post = current_user.posts.build
    @reposts = current_user.reposts
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

  def repost
    @post = Post.find(params[:post_id])
    Repost.new(@post, current_user).call
    go_back
  end

  private
    def posts_params
      params.require(:post).permit(:message)
    end
end
