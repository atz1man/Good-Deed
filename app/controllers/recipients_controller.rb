class RecipientsController < ApplicationController
  def index
    @recipient = Recipient.all
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(recipient_params)
    @recipient.user = current_user
    @recipient.save!
    # recipient_path is recipient#show
    redirect_to recipients_path(@recipient)
    # Logic for redirecting the recipent
    # if @recipient.save!
    # Logic for redirecting the recipent
    #   redirect
    # else
  end

  def show
    @recipient = Recipient.find(params[:id])
    @donation = Donation.new(recipient: @recipient)
  end
  private

  def recipient_params
    params.require(:recipient).permit(:name, :bio, :qr_code)
  end
end
