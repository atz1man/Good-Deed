class MessagesController < ApplicationController
  def new
    # We need @restaurant in our `simple_form_for`
    @recipient = Recipient.find(params[:recipient_id])
    @message = Message.new
  end
end
