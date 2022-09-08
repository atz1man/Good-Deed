class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @recipients = Recipient.where(user: @user) if current_user.admin == true
    @donations = Donation.where(user: @user)
  end
end
