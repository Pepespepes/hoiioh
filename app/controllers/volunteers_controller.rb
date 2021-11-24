class VolunteersController < ApplicationController

  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.user = current_user
    # raise
    if @volunteer.save!
      redirect_to root_path
    else
      redirect_to details_path
    end
  end

  private

  def volunteer_params
    params.require(:volunteer).permit(:first_name, :last_name, :description, :age, :dbs_checked, :employer_id)
  end

end
