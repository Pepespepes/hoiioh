class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(strong_params)
    @charity = Charity.find(params[:charity_id])
    @event.charity = @charity
    if @event.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def event_params
    params.require(:event).permit(:address, :date, :start_time, :duration, :event_name, :description, :number_positions)
  end
end
