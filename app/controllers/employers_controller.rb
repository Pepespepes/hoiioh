class EmployersController < ApplicationController

  def create
    @employer = Employer.new(employer_params)
    @employer.user = current_user
    if @employer.save
      redirect_to root_path
    else
      redirect_to details_path
    end
  end

  def dashboard
    @employer = current_user.employer
    @employees = Volunteer.where(employer: @employer)

    @bookings = []
    @hours = []
    @employees.each do |employee|
      employee.bookings.each do |booking|
        @bookings << booking if booking.event.date < Time.now
        @hours << booking.event.duration if booking.event.date < Time.now
      end
    end

    @enrol_goal = 8
    @events_goal = 25
    @hours_goal = 50


  end

  private

  def employer_params
    params.require(:employer).permit(:company_name)
  end

end
