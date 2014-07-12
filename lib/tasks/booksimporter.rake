namespace :books do

  desc 'Rake task to get books data'
  task :import => :environment do
    i = 0
    books = File.open(File.join("lib/tasks", "freeprogrammingbooks-noindex.md"),"r") #TODO change bk to reg file vs noindex
    books.each_line do |line|
      attrs = :title, :url, :tag
      @book = Book.create {
      #TODO first ck if book title is already in db
      #TODO rewrite to apply tag to subsequent books until there's a new tag
      # if line =~ /[#][#].* /x #TODO - apply sub headings as 2nd tag
      #   @book.tag = line.split(/#*/,2).last
      # end
      if line =~ /^[^#].*/
          if line =~ /^.*[\[].*/
            @title = line.split(/[\[\]]/,3).shift.first
          end
          if line =~ /^.*[\[].*/
            @url = line.split(/[\(\)]/,3).shift.first
          end
      end
      }
    end
  end

end