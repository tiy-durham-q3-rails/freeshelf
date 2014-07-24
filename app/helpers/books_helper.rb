module BooksHelper
  def book_edit_tag_link_to(book)
    link_to content_tag(:i, nil, class: 'fa fa-edit'), edit_tags_book_path(book), remote: true
  end

  def link_to_sort_by(scope)
    link_to scope.titleize, books_path({:sort => scope, :tag => params[:tag]}),
            :remote => true, :class => 'sort_by', :id => "#{scope}"
  end

  def link_to_reverse_order
    return nil if params[:scope].nil?
    arrow_up = content_tag(:span, @sort_name + ' ') + content_tag(:i, nil, class: "fa fa-arrow-up")
    arrow_down = content_tag(:span, @sort_name + ' ') + content_tag(:i, nil, class: "fa fa-arrow-down")
    if params[:order] == 'asc'
      link_to arrow_up, books_path({scope: params[:scope], tag: params[:tag],
                                    page: params[:page], order: 'desc'}), remote: true,
              class: 'reverse_order'
    else
      link_to arrow_down, books_path({scope: params[:scope], tag: params[:tag],
                                      page: params[:page], order: 'asc'}), remote: true,
              class: 'reverse_order'
    end
  end
end
