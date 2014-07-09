class FavoritesController < ApplicationController
  before_action :authorize

  def create
    @f_type = favorite_params[:favoritable_type]
    @f_id = favorite_params[:favoritable_id]

    if current_user.favorites.create(favorite_params)
      render :status => :created
    else
      render :nothing => true, :status => 500
    end
  end

  def destroy
  end

  private

  def favorite_params
    params.require(:favorite).permit(:favoritable_id, :favoritable_type)
  end
end
