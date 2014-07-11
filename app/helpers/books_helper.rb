module BooksHelper
  def link_to_sort_by(name, scope)
    link_to name, sort_path({ :scope => scope }), :remote => true
  end
end
