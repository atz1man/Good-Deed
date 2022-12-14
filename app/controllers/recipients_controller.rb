class RecipientsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:index]

  def index
    # if someone is logged in
    if current_user.present?
      @user = current_user
      # if the user is an admin
      if current_user.admin?
        # if there are search params
        if params[:query].present?
          @recipients = Recipient.where(user: current_user).where("name ILIKE ?", "%#{params[:query]}%").reverse
        else
          @recipients = Recipient.where(user: current_user)
        end
      else
        all_donations = Donation.where(user: current_user)
        @donations = all_donations.select(:recipient_id).distinct.reverse

        if (session[:donation]).present?
          sign_up = session[:donation]
          add_donation = Donation.find(sign_up['id'])
          add_donation.user = current_user
          add_donation.save
          @donations = all_donations.select(:recipient_id).distinct.reverse
          session.clear
        end

      end
    end
  end

  def show
    @recipient = Recipient.find(params[:id])
    if current_user.present?
      if current_user.admin?
        @donations = Donation.where(recipient: @recipient)
      else
        @donations = Donation.where(user: current_user)
      end
    end
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
    # https://www.good-deed.co/recipients/#{@recipient.id}
    #qrcode = RQRCode::QRCode.new("https://good-deed1.herokuapp.com/recipients/#{@recipient.id}")
   # www.good-deed.co
    qrcode = RQRCode::QRCode.new("https://good-deed1.herokuapp.com/recipients/#{@recipient.id}")
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
