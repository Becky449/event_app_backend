class MediaController < ApplicationController
  def create
    media = Media.new(media_params)
    if media.save
      render json: media, status: :created
    else
      render json: media.errors, status: :unprocessable_entity
    end
  end

  def index
    event = Event.find(params[:event_id])
    media = event.media
    render json: media
  end

  private

  def media_params
    params.require(:media).permit(:event_id, :guest_email, :media_url, :media_type)
  end
end
