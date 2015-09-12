class UserSessionsController < ApplicationController

  def new
    @page_title = "登录"
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password], params[:remember])
      redirect_back_or_to(:root, notice: '登录成功')
    else
      @user = User.new
      @user[:email] = params[:email]
      flash.now[:alert] = '邮箱/电话或密码错误！'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_back_or_to(:root, notice: 'Login successful')
  end
end
