class CharitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def create
    @charity = Charity.new(charity_params)
    @charity.user = current_user
    if @charity.save
      redirect_to root_path
    else
      redirect_to details_path
    end
  end

  def show
    @charity = Charity.find(params[:id])
  end

  private

  def charity_params
    params.require(:charity).permit(:charity_name, :category, :description)
  end

end
