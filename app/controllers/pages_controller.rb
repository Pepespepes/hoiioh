class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @events = Event.all
    @markers = @events.geocoded.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude
      }
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
