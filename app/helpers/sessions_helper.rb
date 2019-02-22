module SessionsHelper

  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    # @current_user = nil
    session[:user_id] = nil
    reset_session
    redirect_to root_url, notice: "Logged Out Successfully!"
  end

end