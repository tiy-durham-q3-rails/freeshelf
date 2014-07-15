json.id book.slug
json.(book, :title, :creator, :year_created, :description, :url)
json.tags book.tags.map { |tag| tag.name }
# TODO add host to URL
json.cover url_for(book.cover.url)
json.link api_v1_book_url(book) unless book.new_record?