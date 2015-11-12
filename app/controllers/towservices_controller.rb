require 'securerandom'
class TowservicesController < ApplicationController

  before_action :authenticate_user!

  before_action do
    @towservice = @current_user.towservices.find_by completed: false
    if @towservice.blank?
      @towservice = Towservice.new
      @towservice.user = @current_user
      @towservice.name = [@current_user.email, Time.now].join("-")
      @towservice.permalink = SecureRandom.hex
      @towservice.price = 15000
      @towservice.save!
    end
  end


  def confirmation
     @sale = Payola::Sale.find_by! guid: params[:sale_guid]
     @towservice = @sale.product
   end


end
