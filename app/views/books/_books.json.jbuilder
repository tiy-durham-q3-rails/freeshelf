json.page books.current_page
json.pages books.total_pages
json.books books do |book|
  json.partial! "book", book: book
end