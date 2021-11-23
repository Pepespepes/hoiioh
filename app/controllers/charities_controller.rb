class CharitiesController < ApplicationController

  def create
    @charity = Charity.new(charity_params)
    @charity.user = current_user
    @charity.save
  end

  private

  def charity_params
    params.require(:charity).permit(:charity_name, :category, :description)
  end

end
