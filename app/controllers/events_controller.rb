class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

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

  def index
    @events = Event.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
    end

    @sports_charities = Charity.where(category: "Sports")
    @sports_category_events = []
    @sports_charities.each do |charity|
      charity.events.each do |event|
        @sports_category_events << event
      end
    end

    @human_welfare_charities = Charity.where(category: "Human Welfare")
    @human_welfare_category_events = []
    @human_welfare_charities.each do |charity|
      charity.events.each do |event|
        @human_welfare_category_events << event
      end
    end

    @animal_welfare_charities = Charity.where(category: "Animal Welfare")
    @animal_welfare_category_events = []
    @animal_welfare_charities.each do |charity|
      charity.events.each do |event|
        @animal_welfare_category_events << event
      end
    end

    @environment_charities = Charity.where(category: "Environment")
    @environment_category_events = []
    @environment_charities.each do |charity|
      charity.events.each do |event|
        @environment_category_events << event
      end
    end

    @charity_shops_charities = Charity.where(category: "Charity Shops")
    @charity_shops_category_events = []
    @charity_shops_charities.each do |charity|
      charity.events.each do |event|
        @charity_shops_category_events << event
      end
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:address, :date, :start_time, :duration, :event_name, :description, :number_positions)
  end
end
