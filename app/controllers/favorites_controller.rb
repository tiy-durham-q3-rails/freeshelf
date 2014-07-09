class FavoritesController < ApplicationController
  before_action :authorize

  def create
    if current_user.favorites.create(favorite_params)
      render :nothing => true, :status => :created
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
