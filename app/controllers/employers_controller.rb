class EmployersController < ApplicationController

  def create
    @employer = employer.new(employer_params)
    @employer.user = current_user
    @employer.save
  end

  private

  def employer_params
    params.require(:employer).permit(:company_name)
  end

end
