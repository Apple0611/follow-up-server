class SessionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def new
    @page_title = "登录"
    @user = User.new
  end

  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    if @user
      redirect_back_or_to(:root, notice: '登录成功')
    else
      @user = User.new
      @user[:email] = params[:email]
      flash.now[:alert] = '邮箱/电话或密码错误！'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil;
    redirect_back_or_to(:root, notice: 'Login successful')
  end

  private
  def record_not_found
    render file: 'public/404.html', status: 404, layout: false
  end
end
