class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    # Message need a form to be instiated
    @message = Message.new(message_params)
    # Message needs a chatroom
    @message.chatroom = @chatroom
    # Message needs a user
    @message.user = current_user
    if @message.save
      redirect_to chatroom_path(@chatroom, anchor: "message-#{@message.id}")
    else
      render "chatrooms/show"
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end