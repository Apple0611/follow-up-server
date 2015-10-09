class SettingsController < ApplicationController

  before_action :authenticate_user!

  def index
    @page_title = "设置"
    @user = current_user
  end

  def update

  end
end
