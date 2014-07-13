class SuggestionsController < ApplicationController
  def index
    @suggestions = find_user_suggestions
  end

  # def find_user_suggestions
  #   suggest = []
  #   current_user.favorite_tags.each do |t|
  #     Book.all.each do |b|
  #       if b.tags.include?(t) && b.updated_at < DateTime.now
  #         suggest << b
  #       end # if
  #     end # each recently_update_book
  #   end # each favorite_tag
  #   suggest
  # end
end
