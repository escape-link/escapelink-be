class Api::V0::MessagesController < ApplicationController
  def create
    @message = Message.create!(message_params)
    ActionCable.server.broadcast("game_#{message_params[:channel_id]}", @message)
    render json: @message
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_nickname, :channel_id)
  end
end
