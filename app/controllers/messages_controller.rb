class MessagesController < ApplicationController
  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to messages_path }
        format.turbo_stream
      end
    else
      @messages = Message.all
      render :index, status: :unprocessable_entity
    end
  end
  

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
