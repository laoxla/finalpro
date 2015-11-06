class UsersController < ApplicationController

  before_action :authenticate_user!

  def index
      @result = request.location.city

      pp @result
      @response = Yelp.client.search('houston', { term: 'auto_repair', limit: 16})

  end

  def show
  end

  def zipcode
    		user_zip =  gets.chomp
    		 result

    		if (user_zip)
    			result = Yelp.client.search( user_zip + { term: 'auto_repair', limit: 16}) + userZip;
        end
  end

  def new
       @user = User.new
  end

   def create
     @user = User.new params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
     if @user.save
       sign_in @user
       redirect_to root_path, notice: "Welcome #{@user.first_name}"
     else
       render :new
     end
   end


end
