class PostsController < ApplicationController
  before_action :find_post_id, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_url, notice: "新規投稿を完了しました"
    else
      render :new
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @post.create(post_params)
      redirect_to posts_url, notice: "投稿の編集を完了しました"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "投稿を削除しました"
  end
  
  private
  def find_post_id
    @posts = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:name, :description).merge(:user_id)
  end
end
