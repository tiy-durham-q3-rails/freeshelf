module BooksHelper
  def link_to_sort_by(name, scope, tag)
    unless tag.nil?
      link_to name, sort_path({ :scope => scope, :tag => tag }), :remote => true, :class => 'sort_by'
    else
      link_to name, sort_path({ :scope => scope }), :remote => true, :class => 'sort_by'
    end
  end
end
