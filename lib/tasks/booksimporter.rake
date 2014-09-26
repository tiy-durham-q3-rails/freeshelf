
#TODO ********IMPT - RIGHT NOW THIS CAN ONLY BE RUN ONE TIME BEFORE NEEDING TO DROP THE DB**********

namespace :books do
  desc 'Rake task to get books data'
  task :import => :environment do #TODO create cron on heroku for regularly scheduled refreshes of data
    conn = ActiveRecord::Base.connection
    saved = 1
    processed = 1
    open('https://raw.githubusercontent.com/vhf/free-programming-books/master/free-programming-books.md',
         'User-Agent' => 'freeshelf_app') do |free_books|
      free_books.each_line do |line|
    #NOTE: when using online ref ("open("), need the extra end at end of file
    #free_books = File.open(File.join('lib/assets', 'freeprogrammingbooks.md'),'r').each_line do |line|
      processed +=1
      attrs = :title, :url, :tag, :creator, :slug
        #TODO make tag_list an array.
        #TODO add subheadings as 2nd tag. db dupe as 2nd tag? use the "See..." lines as addtl tags?
        #TODO add ignore Index line?
        #TODO check on quantifiers & +* syntax in sequences
        if line =~  /^[#]{2,}.* /x  ||
            line =~ /^[\s]{0,}[\*]{0,}+[\s]{0,}+[\*]{1,}+[\s]{1,}+(?!\[).*/
          @tag_name = line.split(/[ [[#]*][[\s]*[\*]{1}+[\s]+]]+/,2).last
          processed -= 1
        elsif line =~ /^.*[\[]+.*[\]]+[\s]{0,}+[\(](?!#).*/
          title = line.split(/[.]*[\[\]]/,3)
          title.shift
          url = (title.last).split(/[[\]] [\(] [\)*]]/,3)
          url.shift
          #TODO fix all these shifts so books:import can be run repeatedly without dropping the db. might be ok w live file?
          creatorextra = (url.last).split(/[\s]+[-]{1}+[\s]+(?=[\w])/) #TODO fix edge case creators, e.g.  2.x
          creator3 = (creatorextra.last).split(/[\s]+[Bb]y+[\s]+(?=[\w])/)
          creator2 = (creator3.last).split(/[\s]*[\]\)\(\*]+/)
          creator = (creator2.first).split(/^\w(?=[\\n])+/ || /^.*[\\n]+/) #TODO fix creators, e.g."," "||"

          unless Book.find_by_url(url) #TODO assumes one url per book, but might not be true?
            if creator.first == "\n" || creator.first.nil? || creator.first == "" || creator.first == "s))\n"#creator.first =~ /^[\W]{1,2}/
              #TODO find better fix for edge case (Clipper Tutorial) vs addtl or statement above
              #creator =
              @book = Book.create(title: "#{title.first.truncate(252)}",
                                  url: "#{url.first.truncate(252)}",
                                  creator: "unknown",
                                  tag_list: "#{@tag_name}"
              )
            else
              @book = Book.create(title: "#{title.first.truncate(252)}",
                                  url: "#{url.first.truncate(252)}",
                                  creator: "#{creator.first.truncate(252)}",
                                  tag_list: "#{@tag_name}"
                                  )
            end
            if @book.creator =~ /^[\s]*[\-\.\*\,\|].*/ || @book.creator =~ /^[\s]*[\d\-\.\*\,].*/
              puts "*********Check this record. Creator info may not have imported correctly:*********"
              #TODO create non-inline list of odd creator info.
              #TODO refactor this file!!!
            end
            puts "New book ##{saved}: #{@book.title}"
            puts "\t\t(#{@book.url}).\n\t\t\ttag(s): #{@book.tag_list} \t\t\t\t\tby: #{@book.creator}"
            @book.save!
            saved += 1
          else
            puts "***Did not import: either was already in the database, or your file has dupe urls. #{@book.title}.***"
            puts "\t\t(#{@book.url}).\n\t\t\ttag(s): #{@book.tag_list} \t\t\t\t\tby: #{@book.creator}"
          end
        elsif line =~ /^[\s].*/
          processed -= 1
        else
          processed -= 1
        end
      end
      puts '---------------------------------------'
      puts "Added #{saved}/#{processed} books."
      puts '---------------------------------------'
     end
  end
end
