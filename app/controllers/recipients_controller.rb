class RecipientsController < ApplicationController
  def index
    @user = current_user
    @recipients = Recipient.where(user: current_user) if current_user.admin == true
    all_donations = Donation.where(user: current_user)
    @donations = all_donations.select(:recipient_id).distinct
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
    redirect_to recipients_path(@recipient)
  end

  def edit
    @recipient = Recipient.find(params[:id])
  end

  def destroy
    @recipient = Recipient.find(params[:id])
    @recipient.destroy
    redirect_to recipients_path, status: :see_other
  end

  private

  def recipient_params
    params.require(:recipient).permit(:name, :bio, :qr_code, :photo)
  end
end
