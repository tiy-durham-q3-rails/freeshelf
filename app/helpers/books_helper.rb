module BooksHelper
  def edit_tag_link_to(book)
    link_to content_tag(:i, nil, class: 'fa fa-edit'), edit_tags_book_path(book), remote: true
  end
end
