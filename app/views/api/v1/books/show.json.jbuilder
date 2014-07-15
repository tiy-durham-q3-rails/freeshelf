json.book do
  json.partial! "book", book: @book
end
json.related_books @related_books do |book|
  json.partial! "book", book: book
end