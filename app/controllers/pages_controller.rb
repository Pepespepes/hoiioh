class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
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

  # private

  # def volunteer_params
  #   params.require(:volunteer).permit(:first_name, :last_name, :employer_id, :description, :age, :dbs_checked)
  # end

  # def employer_params
  #   params.require(:employer).permit(:company_name)
  # end

  # def charity_params
  #   params.require(:charity).permit(:charity_name, :category, :description)
  # end
end
