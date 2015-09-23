class IdentitiesController < ApplicationController
  def new
    @page_title = "注册"
    @identity = env['omniauth.identity']
  end

  def create
    #code
  end
end
