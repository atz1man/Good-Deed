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
    @donation = Donations.new(donation_params)
    @donation.recipient = @recipient

    if current_user.present?
      @donation.user = current_user
    end

    @donation.save
    # to do
    # redirect_to recipient_donation_confirmation_path(@donation)
  end

  private

  # def set_recipient
  #   @recipient = Recipient.find(params[:recipient_id])
  # end

  def donation_params
    params.require(:donation).permit(:amount)
  end
end
