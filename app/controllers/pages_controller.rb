class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  # def category_charities(categ)
  #   Charity.where(category: categ)
  # end

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
