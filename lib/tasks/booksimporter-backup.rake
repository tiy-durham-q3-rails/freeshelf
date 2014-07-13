namespace :books do

  desc 'Rake task to get books data'
  task :importbackup => :environment do
    conn = ActiveRecord::Base.connection
    i = 1
    books = File.open(File.join("lib/tasks", "freeprogrammingbooks-noindex.md"),"r")
    #TODO change bk to reg file vs noindex & set to ignore index tag & everything thereafter
    attrs = :title, :url, :tag

      books.each_line do |line|

              #TODO first ck if book title is already in db
              #TODO rewrite to apply tag to subsequent books until there's a new tag
              # if line =~ /[#][#].* /x #TODO - apply sub headings as 2nd tag
              #   @book.tag = line.split(/#*/,2).last
              # end
        #if line =~ /^[^#].*/ && line =~ /^[^\s].*/ #if line does NOT start w a # or blank space...
        #if line =~ /[#][#].* /x #&&  line !=~ /^[\s].*/ #if line does NOT start w a # or blank space...
            #if line =~ /^.*[\[].*/ #if line has [x], set title to x
        if line =~ /[#][#].* /x
        elsif line =~ /^.*[\[].*/
          book = Book.create
              title = line.split(/[\[\]]/,3)
              title.shift
              book.title = "#{title.first.truncate(252)}"
            #end
           # if line =~ /^.*[\[].*/ #if line has (y), set title to y
              url = line.split(/[\(\)]/,3)
              url.shift
              book.url = "#{url.first.truncate(252)}"
          #  end
          book.author = "nil"
          book.save!
          puts "new book saved #{i}. should be 1257"
          i += 1
        elsif line =~ /^[\s].*/
        else
        end
        #@book.title = @title || "title"
        #@book.url = @url || "url"

        "puts done w task"
      end


  end

end
