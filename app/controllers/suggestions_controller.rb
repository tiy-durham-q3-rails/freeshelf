class SuggestionsController < ApplicationController
  def index
    @suggestions = find_user_suggestions
  end

  def find_user_suggestions
    suggest = []
    current_user.favorite_tags.each do |t|
      Book.all.each do |b|
        if b.tags.include?(t) && b.updated_at < DateTime.now
          suggest << b
        end # if
      end # each recently_update_book
    end # each favorite_tag
    h = Hash.new(0)
    suggest.each{ |e| h[e] += 1 }
    sort = h.sort{|a,b| a[1] <=> b[1]}
    suggest = sort.collect { |k, v| k }
    suggest.reverse
  end # find_user_suggestions
end
