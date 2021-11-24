#class ReviewsController < ApplicationController

  #def new
    #@review = Review.new
    #@booking = Booking.find(params[:booking_id])
  #end

  #def create
    #@review = Review.new(review_params)
    #@booking = Booking.find(params[:booking_id])
    #@event = Event.find(@booking.user_id)
    #@review.booking = @booking
    #if @review.save
      #redirect_to profile_path(@current_user)
    #else
      #render :new
    #end
  #end

  # def index
  #  @reviews = Review.all
  # end


  #private

  #def review_params
   # params.require(:review).permit(:review_rating, :review_content)
  #end
  #end
  #end
