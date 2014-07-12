module BooksHelper
  def link_to_sort_by(name, scope, tag)
    unless tag.nil?
      link_to name, sort_path({ :scope => scope, :tag => tag }), :remote => true, :class => 'sort_by'
    else
      link_to name, sort_path({ :scope => scope }), :remote => true, :class => 'sort_by'
    end
  end

  def link_to_reverse_order
    return nil if params[:scope].nil?
    arrow_up = content_tag( :span, @sort_name + ' ') + content_tag( :i, nil, class: "fa fa-arrow-up")
    arrow_down = content_tag( :span, @sort_name + ' ') + content_tag( :i, nil, class: "fa fa-arrow-down")
    if params[:order] == 'asc'
      link_to arrow_up, sort_path({scope: params[:scope], tag: params[:tag], page: params[:page], order: 'desc' }), remote: true
    else
      link_to arrow_down, sort_path({scope: params[:scope], tag: params[:tag], page: params[:page], order: 'asc' }), remote: true
    end
  end
end
