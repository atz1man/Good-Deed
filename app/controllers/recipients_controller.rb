class RecipientsController < ApplicationController
  def index
    @recipients = Recipient.where(user: current_user)
  end

  def show
    @recipient = Recipient.find(params[:id])
    @donation = Donation.new(recipient: @recipient, user: current_user)
    @qr_code = RQRCode::QRCode.new(@recipient.qr_code)
    @svg = @qr_code.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      standalone: true
    )

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

  private

  def recipient_params
    params.require(:recipient).permit(:name, :bio, :qr_code, :photo)
  end
end
