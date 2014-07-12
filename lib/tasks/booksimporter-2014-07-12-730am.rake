namespace :books do

  desc 'Rake task to get books data'
  task :import2 => :environment do
    i = 0
    books = File.open(File.join("lib/tasks", "freeprogrammingbooks-noindex.md"),"r") #TODO change bk to reg file vs noindex
    books.each_line do |line|
      attrs = :title, :url, :tag
   #   create_nonexisting_books
  #  end
  #end




  #def create_nonexisting_books
    @book = Book.create
    #TODO find if book is already in db
    # #Book.find_by_book_title(@title) ||
    #connection.find_or_initialize_by_identifier(@title)
     #TODO apply get_tags
     # #@book.tag = line.get_tag
     #Book.new {
        # @book.title = line.get_title,
        # @book.url = line.get_url
    # }
      get_tag
      get
    @book.save!
      end
  end

  def get_tag #TODO rewrite to apply tag to subsequent books until there's a new tag
    if line =~ /[#][#].* /x #TODO - pull sub headings
      @book.tag = line.split(/#*/,2).last
    end
  end

  def get_title
    if line =~ /^.*[\[].*/
      @book.title = line.split(/[\[\]]/,3).shift.first
    end
  end

  def get_url
    if line =~ /^.*[\[].*/ #TODO combine url & title methods?
      @book.url = line.split(/[\(\)]/,3).shift.first
    end
  end


end