class SessionsController < ApplicationController
  def new
    
  end

  def create
    #raise request.env['omniauth.auth'].to_yaml
    user = User.find_by_login(params[:login])
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to user, :notice => t('login sucess')
    else
      redirect_to login_path, :alert => t('login failed')
    end
  end

  def destroy
    sign_out
    redirect_to login_path, notice: t('logged out')
  end
end
