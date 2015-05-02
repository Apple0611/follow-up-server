class UserSessionsController < ApplicationController

  def create
    case request.method

    when "GET"
      @page_title = "登录"
      @user = User.new
      render 'signin'

    when "POST"
      if @user = login(params[:email], params[:password])
        redirect_back_or_to(:root, notice: '登录成功')
      else
        flash.now[:alert] = '用户名或密码错误！'
        render 'signin'
      end
    end
  end

  def destroy
    logout
    redirect_back_or_to(:root, notice: 'Login successful')
  end
end
