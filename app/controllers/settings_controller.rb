class SettingsController < ApplicationController

  before_action :require_login

  def index
    @page_title = "设置"
    @user = current_user
  end
end
