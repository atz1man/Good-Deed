class DonationsController < ApplicationController

  def new
    @recipient = Recipient.find(params[:recipient_id])
    @donation = Donation.new
    # @recipients = Recipient.all
  end

  def create
    @donation = Donation.new(donation_params)
    @recipient = Recipient.find(params[:recipient_id])
    @donation.recipient = @recipient
    @donation.user = current_user
    @donation.save!
    redirect_to recipients_path
  end

  def confirmation
    @recipient = Recipient.find(params[:recipient_id])
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :recipient_id)
  end
end
