class UsersController < ApplicationController
  before_action :find_user_id, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "ユーザの新規作成を完了しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end
  
  def update
    if @user.create(user_params)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ユーザの編集を終えました"
    else
      render :new
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
  def find_user_id
    @user = User.find_by(id: params[:id])
  end
end
