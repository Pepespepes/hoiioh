class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @event = Event.find(params[:event_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.event = current_event
    @volunteer = current_user.volunteer
    @booking.volunteer = @volunteer
    if @booking.save
      redirect_to profile_path
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path
  end

  private

  def event_params
    params.require(:event).permit(:location, :date, :start_time, :duration, :description, :number_positions)
  end
end
