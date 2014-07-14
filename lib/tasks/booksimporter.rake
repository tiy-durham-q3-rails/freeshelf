namespace :books do
  desc 'Rake task to get books data'
  task :import => :environment do
    conn = ActiveRecord::Base.connection
    i = 1
    open('https://raw.githubusercontent.com/vhf/free-programming-books/master/free-programming-books.md',
         'User-Agent' => 'freeshelf_app') do |free_books|
    free_books.each_line do |line|
    #NOTE: when using online ref, need the extra end at end of file
    #free_books = File.open(File.join('lib/tasks', 'freeprogrammingbooks-noindex.md'),'r').each_line do |line|

      attrs = :title, :url, :tag, :creator, :slug
        #tag = Tag.create
        #TODO rewrite to apply tag to subsequent books until there's a new tag
        #TODO - apply sub headings as 2nd tag
        if line =~  /^[#]{2,}.* /x  ||
            line =~ /^[\s]{0,}[\*]{0,}+[\s]{0,}+[\*]{1,}+[\s]{1,}+(?!\[).*/
          #TODO get the above to ignore the Index line
          #TODO Figure out how to store tags & associate them with books
          #@tag = line.split(/[ [[#]*][[\s]*[\*]{1}+[\s]+]]+/,2).last
        elsif line =~ /^.*[\[]+.*[\]]+[\s]{0,}+[\(](?!#).*/
          title = line.split(/[.]*[\[\]]/,3)
          title.shift
          url = (title.last).split(/[[\]] [\(] [\)*]]/,3)
          url.shift
          creatorextra = (url.last).split(/[\s][-]{1}+[\s]+[\w]+/ || /[\s]{0,}+[b]{1}+[y]{1}+[\s]+[\w]+/)
          creator2 = (creatorextra.last).split(/[\s]*[\(\[]+/)

          creator = (creator2.first).split(/^\w(?=[\\n])+/ || /^.*[\\n]+/)
          #TODO get title, url & creator to be value from file *OR* to be "Not available"
          unless Book.find_by_url(url)
            if creator.first =~ /^\W.*/ || creator.first.nil? || creator.first == ""
              creator = "Not Available"
              creator[0] = "N/A"
            end
              @book = Book.create(title: "#{title.first.truncate(252)}",
                                  url: "#{url.first.truncate(252)}",
                                  creator: "#{creator.first.truncate(252)}"
                                  )
            # @book.assign_attributes(:title => "#{title.first.truncate(252)}")
            # #book.url = "Not available"
            # @book.assign_attributes(:url => "#{url.first.truncate(252)}")
            # #book.creator = "Not available"
            # @book.assign_attributes(:creator => "#{creator.first.truncate(252)}.")
            # #@book.assign_attributes(:tag => "#{@tag}")
            # @book.slug = "NotAvailable"
           # @book.tag_list = "#{@tag}"
            @book.save!
            i += 1
          end
#binding.pry
          # @book = Book.find_or_create_by(url: @book.url) do |c| #TODO ck if book url is already in db
          #   c.slug = "Not available"
          #   #TODO add creator here also?
          # end
        elsif line =~ /^[\s].*/
          #puts "blank line"
        else
        end
        #@book.title = @title || "title"
        #@book.url = @url || "url"
      end
      puts "Created #{i}/1095+4 books."
    end
  end
end
