class UsersController < ApplicationController

before_action :authenticate_user!, except: [:new, :create]

  def index
    @user = User.where("id = ?", @current_user.id)
      @result = request.location.city


  end

  def show
      @user = User.where("id = ?", @current_user.id)
    # @users =
    #   params[:lat] && params[:lng]]
    #     user_coordinates = {
    #     latitude: params[:lat],
    #     longitude: params[:lng]
    #   }
      # @response.find_by params[:id]
  end

  def new
       @user = User.new
  end

   def create
     @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
     if @user.save
       sign_in @user
       redirect_to root_path, notice: "Welcome to Towbuddy, #{@user.first_name}"
     else
       render :new
     end
   end


end
