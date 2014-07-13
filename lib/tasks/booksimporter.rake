namespace :books do
  desc 'Rake task to get books data'
  task :import => :environment do
    conn = ActiveRecord::Base.connection
    i = 1
    # open('https://raw.githubusercontent.com/vhf/free-programming-books/master/free-programming-books.md',
    #      'User-Agent' => 'freeshelf_app') do |free_books|
    #free_books.each_line do |line|

    free_books = File.open(File.join('lib/tasks', 'freeprogrammingbooks-noindex.md'),'r').each_line do |line|
      attrs = :title, :url, :tag
        #tag = Tag.create
        #TODO first ck if book title is already in db
        #TODO rewrite to apply tag to subsequent books until there's a new tag
        #TODO - apply sub headings as 2nd tag
        if line =~  /^[#]{2,}.* /x  || line =~ /^[\s]{0,}[\*]{0,}+[\s]{0,}+[\*]{1,}+[\s]{1,}+(?!\[).*/
          @tag = line.split(/[ [[#]*][[\s]*[\*]{1}+[\s]+]]+/,2).last
        elsif line =~ /^.*[\[].*/
          title = line.split(/[.]*[\[\]]/,3)
          title.shift
          url = (title.last).split(/[[\]] [\(] [\)*]]/,3)
          url.shift
          creatorextra = (url.last).split(/[\s][-]{1}+[\s]+[\w]+/ || /[\s]{0,}+[b]{1}+[y]{1}+[\s]+[\w]+/)
          creator2 = (creatorextra.last).split(/[\s]*[\(\[]+/)

          creator = (creator2.first).split(/^\w(?=[\\n])+/ || /^.*[\\n]+/)

          @book.build(:title => "#{title.first.truncate(252)}")
          #book.url = "nil"
          @book.bulid(:url => "#{url.first.truncate(252)}")
          #book.creator = "nil"
          @book.build(:creator => "#{creator.first.truncate(252)}.")
          @book.build(:tag => "#{@tag}")
#binding.pry
          @book = Book.find_or_create_by(url: @book.url) do |c|
            c.slug = "nil"
            #TODO add creator here also?
          end
          @book.save!
          i += 1
        elsif line =~ /^[\s].*/
          #puts "blank line"
        else
        end
        #@book.title = @title || "title"
        #@book.url = @url || "url"
      end
      puts "Created #{i}/1095+4 books."
    end
  #end
end
