class RecipientsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if current_user.present?
      @user = current_user
      if current_user.admin?
        if params[:query].present?
          @recipients = Recipient.where(user: current_user).where("name ILIKE ?", "%#{params[:query]}%").reverse
        else
          @recipients = Recipient.where(user: current_user).reverse
        end
      end
    else
      all_donations = Donation.where(user: current_user)
      @donations = all_donations.select(:recipient_id).distinct.reverse
    end
  end

  def show
    @recipient = Recipient.find(params[:id])
    @donations = Donation.where(recipient_id: @recipient.id)
    @donation = Donation.new(recipient: @recipient, user: current_user)
  end

  def new
    @recipient = Recipient.new
  end

  def create
    @recipient = Recipient.new(recipient_params)
    @recipient.user = current_user
    @recipient.save!
    #Previous version linking to the heroku app address
    #qrcode = RQRCode::QRCode.new("https://good-deed1.herokuapp.com/recipients/#{@recipient.id}")
   # www.good-deed.co
    qrcode = RQRCode::QRCode.new("https://www.good-deed.co/recipients/#{@recipient.id}")
    png = qrcode.as_png(
      bit_depth: 1,
      border_modules: 1,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 10,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 250
    )

    Cloudinary::Uploader.upload("#{png.to_data_url}",
      :public_id => "qr_code#{@recipient.id}",
      :use_filename => true
      )

    redirect_to recipient_path(@recipient)
  end

  def edit
    @recipient = Recipient.find(params[:id])
  end

  def update
    recipient = Recipient.find(params[:id])
    recipient.update(recipient_params)
    redirect_to recipient_path(recipient)
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

def create_pictures
  photos = params.dig(:recipient, :pictures) || []
  photos.each do |photo|
    @recipient.pictures.create(photo: photo)
  end
end
