class SuggestionsController < ApplicationController
  def index
    @suggestions = find_user_suggestions
  end

  def find_user_suggestions
    suggest = []
    h = Hash.new(0)

    current_user.favorite_tags.each do |tag|
      Book.all.each do |book|
        if (current_user.last_looked_at_suggestions < book.updated_at) && book.tags.include?(tag)
          suggest << book
        end # if
      end # each recently_update_book
    end # each favorite_tag

    suggest.each{ |e| h[e] += 1 }
    
    sort = h.sort{|a,b| a[1] <=> b[1]}

    suggest = sort.collect { |k, v| k }

    current_user.update(:last_looked_at_suggestions => (DateTime.now ))# subtract minutes

    suggest.reverse
  end # find_user_suggestions
end
