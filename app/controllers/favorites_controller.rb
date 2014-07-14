class FavoritesController < ApplicationController
  before_action :authorize

  def create
    @favoritable = favorite_params[:favoritable_type].constantize.find(favorite_params[:favoritable_id])

    if current_user.favorites.create(favoritable: @favoritable)
      render :status => :created
    else
      render :nothing => true, :status => :internal_server_error
    end
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    @favoritable = @favorite.favoritable

    if @favorite.destroy
      render :create
    else
      render :nothing => true, :status => :internal_server_error
    end
  end

  def show
  end

  private

  def favorite_params
    params.require(:favorite).permit(:favoritable_id, :favoritable_type)
  end
end
