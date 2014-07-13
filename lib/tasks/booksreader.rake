namespace :books do

  desc 'Rake task to get books data'
  task :read => :environment do
    i = 1
    f = File.open(File.join("lib/tasks", "freeprogrammingbooks-noindex-abbr.md"),"r").each_line do |line|
      if line =~ /[#][#].* /x
          tag = line.split(/#*/,2).last
          puts "---------------------------"
          puts "#{tag}"
          puts "---------------------------"

        #TODO - pull sub headings
      elsif line =~ /^.*[\[].*/
            title = line.split(/[\s]{0,}[\[\]]+/,3)
            title.shift
            url = (title.last).split(/[\]\(\)]/,3) #TODO fix ones like cheatsheet(free)
            url.shift

            authorextra = (url.last).split(/[\s]{1,}+[-]{1}+[\s]{0,}+/)
            author = (authorextra.last).split(/[\s]{0,}[\(\[]+/,2)
            #TODO remove \n's from lines. could splice last two chars if \n
               #(author.first).gsub!(/.{2}$/,'')
            binding.pry
            puts "Title-#{i}: #{title.first}. url: #{url.first}. author: #{author.first}."
            i += 1

      elsif line =~ /^[\s].*/
        #puts "blank line"
      else
        puts "lost header##########################"
      end
    end
  end

    #
  # books = Book  #not sure what nba_search is. needs to be replaced but leaving for now
  #   books.each do |i|
  #     i.each do |hash|
  #       @book = Book.new({
  #         # Code to instantiate a book
  #       })
  #     @book.save
  #     end
  #   end
  #   puts "#{Time.now} - Success!" #not sure we want this exactly, but prob a "completed" or something?

end