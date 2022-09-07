class RecipientsController < ApplicationController

  def new
    @recipent = Recipient.new
  end

    def index
      @recipient = Recipient.all
    end


  def create
    @recipient = Recipient(recipient_params)
    @recipient.user = current_user
    # if @recipient.save!
    # Logic for redirecting the recipent
    #   redirect
    # else
  end


  def show
    @recipient = Recipient.find(params[:id])
    @donation = Donation.new(recipient: @recipient)
  end
end
