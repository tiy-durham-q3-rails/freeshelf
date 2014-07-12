class SuggestionsController < ApplicationController
  def index
    find_user_suggestions
  end

  def find_user_suggestions
    @suggestions = []
    current_user.favorite_books.each do |b|
      if b.updated_at < (DateTime.now) #(current_user.last_looked_at_suggestions)
        @suggestions << b
      end
    end
  end

  def possible_suggestions
    @possible_suggestions = []

  end
end
