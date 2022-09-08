class DonationsController < ApplicationController

  def new
    @donation = Donation.new
    @recipients = Recipient.all
  end

  def create
    @donation = Donation.new(donation_params)
    @recipient = Recipient.find(params[:recipient_id])
    @donation.recipient = @recipient
    @donation.user = current_user
    @donation.save!
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :recipient_id)
  end
end
