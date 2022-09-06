class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

    if current_user.admin == true
      @recipients = Recipient.where(user: @user)
    end
    @donations = Donation.where(user: @user)
  end

end
