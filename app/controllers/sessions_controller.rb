class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user&.authenticate(password: session_params[:password])
      session[:user_id] = @user.id
      redirect_to root_path, notice: "ログインが完了しました"
    else
      flash[:notice] = "ログインに失敗しました"
      render :new
    end
  end

  def destroy
    reset_session
  end

  private
  
  def session_params
    params.require(:params).permit(:email, :password)
  end
end
