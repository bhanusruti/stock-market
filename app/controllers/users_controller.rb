class UsersController < ApplicationController



  def new

  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def create
   user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],

      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account! Please login to continue!!'
      redirect_to "/login"
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

  def dashboard
  end

end
