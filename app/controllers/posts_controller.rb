class PostsController < ApplicationController
  before_action :find_post, except: [:index, :new, :create]
  def index
    @posts = Post.all
    @post = current_user.posts.build
  end

  def show; end

  def create
    @post = current_user.posts.build(posts_params)
    return go_back if @post.save
    render 'new'
  end

  def edit; end

  def update
    return redirect_to user_post_path(@user, @post) if @post.update(posts_params)
    render 'edit'
  end

  def destroy
    @post.destroy
    go_back
  end

  private

    def posts_params
      params.require(:post).permit(:message)
    end

    def find_post
      @post = Post.find(params[:id])
      @user = @post.user
    end
end
