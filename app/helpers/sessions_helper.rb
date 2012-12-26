module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.id
    @current_user = user
  end

  def sign_out
    cookies.delete(:remember_token)
    @current_user = nil
  end

end
