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

  private

  def employer_params
    params.require(:employer).permit(:company_name)
  end

end
