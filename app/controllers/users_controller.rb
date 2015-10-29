class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
      @users = User.all
      @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
      end
  end

  def show
  end

  def new
       @user = User.new
     end

     def create
       @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
       if @user.save
         sign_in @user
         redirect_to root_path, notice: "Welcome #{@user.user_name}"
       else
         render :new
       end
     end


end
