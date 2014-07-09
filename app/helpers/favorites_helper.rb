module FavoritesHelper
  def favorite_link_to(item)
    params = {:favorite => {:favoritable_id => item.id, :favoritable_type => item.class.to_s}}
    link_to content_tag(:i, nil, :class => "fa fa-star-o", :id => "favorite-book-#{@book.id}"),
            favorites_path(params), :method => :post, :remote => true
  end
end
