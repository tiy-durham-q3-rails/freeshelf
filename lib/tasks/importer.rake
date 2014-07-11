namespace :books do

  desc 'Rake task to get books data'
  task :import => :environment do
    i = 0
    f = File.open(File.join("lib/tasks", "freeprogrammingbooks.md"),"r").each_line do |line|
      if line =~ /[#][#].* /x
          puts line.split

        #TODO - pull sub headings
      elsif line =~ /^.*[\[].*/
            puts "imeabook #{i}"
            i += 1
      elsif line =~ /^[\s].*/
        puts "blank line"
      else
        puts "lost header##########################"
      end
    # puts "#{f.readline(1)}"
      #f= File.open("#{Rails.root}/app/views/static/#{ params[:page] }.md", &:readline)
      # f = File.open("/lib/tasks/freeprogrammingbooks.md", 'r') do |file|
      #   file.readlines()
      #   binding.pry
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