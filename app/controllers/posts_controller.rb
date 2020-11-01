class PostsController < ApplicationController

  def index
    @user = current_user.followed_users.pluck(:id) << current_user.id
    @posts = Post.where(user_id: @user).paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @post = current_user.posts.build
  end

  def show
    @post = Post.find_by(id: params[:id]) 
    return redirect_to user_path(current_user) if @post == nil
    @user = @post.user
  end

  def create
    @post = current_user.posts.create(posts_params)
    @post.message = MentionLink.new(@post.message).call
    GetMention.new(@post.message, @post).call
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
