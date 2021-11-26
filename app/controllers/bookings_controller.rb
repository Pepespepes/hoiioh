class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @event = Event.find(params[:event_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @event = Event.find(params[:event_id])
    @booking.event = @event
    @volunteer = current_user.volunteer
    @booking.volunteer = @volunteer
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def index
    @bookings = Booking.all
    @bookings = current_user.volunteer.bookings
    @upcoming_bookings = @bookings.select do |booking|
      booking.event.date > Date.today || (booking.event.date == Date.today && booking.event.start_time > Time.now.hour)
    end
    @past_bookings = @bookings.select do |booking|
      booking.event.date < Date.today || (booking.event.date == Date.today && booking.event.start_time < Time.now.hour)
    end
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

  def booking_params
    params.require(:booking).permit(:employer_associated)
  end
end
