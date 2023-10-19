class Api::V0::MessagesController < ApplicationController
  def create
    if message_params.present?
      @message = Message.create!(message_params)
      ActionCable.server.broadcast("game_#{message_params[:channel_id]}", @message)
      render json: @message
    else
      Rails.logger.warn("Received unrecognized command: #{params.inspect}")
      render json: { error: 'Invalid message format' }, status: 400
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_nickname, :channel_id)
  rescue ActionController::ParameterMissing
    nil
  end
end
