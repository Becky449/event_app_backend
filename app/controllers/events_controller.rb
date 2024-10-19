class EventsController < ApplicationController
  def create
    event = Event.new(event_params)
    if event.save
      event.qr_code = generate_qr_code(event.id)
      event.save
      render json: event, status: :created
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  def show
    event = Event.find(params[:id])
    render json: event
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :date)
  end

  def generate_qr_code(event_id)
    qrcode = RQRCode::QRCode.new("https://your-app.com/events/#{event_id}")
    qrcode.as_png(size: 200).to_data_url
  end
end
