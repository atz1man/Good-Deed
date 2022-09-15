class DonationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @recipient = Recipient.find(params[:recipient_id]).reverse
    @donation = Donation.new
    # @recipients = Recipient.all
  end

  def create
    @donation = Donation.new(donation_params)
    @recipient = Recipient.find(params[:recipient_id])
    @donation.recipient = @recipient
    @donation.user = current_user
    @donation.save!

    session[:donation] = @donation

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        price_data: {
          currency: 'gbp',
          unit_amount: @donation.amount*100,
          product_data: {
            name: @recipient.name,
            description: "test"
          },
        },
        quantity: 1,
      }],
      mode: 'payment',
      success_url:  new_recipient_donation_url(@recipient),
      cancel_url: root_url
    )
    @donation.update(checkout_session_id: session.id)

    redirect_to recipient_confirmation_path(@recipient, donation: @donation)
  end

  def confirmation
    # @donation = Recipient.find(params[:recipient_id]).donations.last.amount
    @donation = Donation.find(params[:donation])
    @recipient = Recipient.find(params[:recipient_id])
  end

  private

  def donation_params
    params.require(:donation).permit(:amount, :message, :recipient_id)
  end
end
