json.book do
  json.partial! "book", :book => @book
end
json.errors @book.errors