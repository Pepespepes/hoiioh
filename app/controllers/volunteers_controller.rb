class VolunteersController < ApplicationController

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user = current_user
    @volunteer.save
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :employer_id, :description, :age, :dbs_checked)
  end

end
