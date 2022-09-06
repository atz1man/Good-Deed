class RecipientsController < ApplicationController

def new
  @recipent = Recipient.new
end

def create
  @recipient = Recipient(recipient_params)
  @recipient.user = current_user
  # Logic for redirecting the recipent
  # if @recipient.save!
  #   redirect
  # else
end


def show
  @recipient = Recipient.find(params[:id])
  @donation = Donation.new(recipient: @recipient)
end

def index
@recipient = Recipient.all
end
end
