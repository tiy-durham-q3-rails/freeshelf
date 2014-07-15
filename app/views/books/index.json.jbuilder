json.page @books.current_page
json.pages @books.total_pages
unless @books.first_page?
  json.prev books_url(page: @books.prev_page, format: "json")
end
unless @books.last_page?
  json.next books_url(page: @books.next_page, format: "json")
end
json.books @books do |book|
  json.partial! "book", book: book
end