class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # def category_charities(categ)
  #   Charity.where(category: categ)
  # end

  def home
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


  def details
    if current_user.current_role == "Volunteer"
      @volunteer = Volunteer.new
    elsif current_user.current_role == "Employer"
      @employer = Employer.new
    else
      @charity = Charity.new
    end
  end

end
