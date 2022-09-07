class DonationsController < ApplicationController
  # before_action :set_recipient, only: %i[new create]

  def new
    @donation = Donation.new
    @recipients = Recipient.all

  end

  # def show
  #   @donation = Donations.find(params[:id])
  # end


  def create
    @donation = Donation.new(donation_params)
    @donation.recipient = Recipient.find(donation_params[:recipient_id].to_i)
    if current_user.present?
      @donation.user = current_user
    end
    @donation.save
    flash[:notice] = "Thank you for your donation!"
    # to do
    # redirect_to recipient_donation_confirmation_path(@donation)
  end

  private

  # def set_recipient
  #   @recipient = Recipient.find(params[:recipient_id])
  # end

  def donation_params
    params.require(:donation).permit(:amount, :recipient_id)
  end
end
