module FavoritesHelper
  include SessionsHelper

  def favorite_id(item)
    "favorite-#{dom_id(item)}"
  end

  def favorite_link_to(item)
    params = {:favorite => {:favoritable_id => item.id, :favoritable_type => item.class.to_s}}
    favorite = current_user.favorites.where(favoritable: item).take
    if favorite.present?
      link_to content_tag(:i, nil, :class => "fa fa-star favorited"), favorite_path(favorite),
              :method => :delete, :remote => true, :class => "favorite", :id => favorite_id(item)
    else
      link_to content_tag(:i, nil, :class => "fa fa-star"), favorites_path(params),
              :method => :post, :remote => true, :class => "favorite", :id => favorite_id(item)
    end
  end
end
