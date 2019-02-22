class SessionsController < ApplicationController
  include SessionsHelper
  # skip_before_action :require_user, only: [:new, :create]
  before_action :not_logged_in, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
       #  unless user.role="Realtor"
      #   return redirect_to admin_path notice: "Logged in!"
      redirect_to user, notice: "Logged in!"
      #  end
    else
      puts "not logging in"
      flash.now.alert = 'Email or password entered is incorrect'
      render :new
    end
  end

  def destroy
    log_out
    # redirect_to root_url, notice: "Logged out!"
  end
end
