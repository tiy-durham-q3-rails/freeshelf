namespace :books do
  desc 'Rake task to get books data'
  task :read => :environment do
    i = 1
    open('https://raw.githubusercontent.com/vhf/free-programming-books/master/free-programming-books.md',
         'User-Agent' => 'freeshelf_app') do |free_books|
      free_books.each_line do |line|
        if line =~  /^[#]{2,}.* /x  || line =~ /^[\s]{0,}[\*]{0,}+[\s]{0,}+[\*]{1,}+[\s]{1,}+(?!\[).*/
          #   #TODO ck The Scheme Programming...Programming Windows 8...Also see...
          #TODO Tex should get See also LaTex tag
          tag = line.split(/[ [[#]*][[\s]*[\*]{1}+[\s]+]]+/,2).last
          puts '---------------------------'
          puts "#{tag}"
          puts '---------------------------'
          #set book.tag = tag
        elsif line =~ /^.*[\[]+.*[\]]+[\s]{0,}+[\(](?!#).*/
          #TODO find the two See also & For resources... & see if same as 3 items below.
          # line above linux header.
          title = line.split(/[.]*[\[\]]/,3)
          title.shift
          url = (title.last).split(/[[\]] [\(] [\)*]]/,3)
          url.shift
          creatorextra = (url.last).split(/[\s][-]{1}+[\s]+[\w]+/ || /[\s]{0,}+[b]{1}+[y]{1}+[\s]+[\w]+/)
          creator2 = (creatorextra.last).split(/[\s]*[\(\[]+/)
        # binding.pry
          creator = (creator2.first).split(/^\w(?=[\\n])+/ || /^.*[\\n]+/)
            #TODO rm \n's fr creators w/o trailing chars.
            #TODO fix creators like "atariarchives..." & ", University..."
            #TODO fix creator for clipper tutorial
          puts "Book#{i}/1095+4: #{title.first}. url: #{url.first}. creator: #{creator.first}. Tag: #{tag}"
          i += 1
        elsif line =~ /^[\s].*/
          #puts "blank line"
        else
          puts 'lost header##########################'
        end
      end
    end
  end
end

