namespace :books do
  desc 'Rake task to get books data'
  task :read => :environment do
    i = 1
    open('https://raw.githubusercontent.com/vhf/free-programming-books/master/free-programming-books.md',
         'User-Agent' => 'freeshelf_app') do |free_books|
      free_books.each_line do |line|
         #TODO ck The Scheme Programming...Programming Windows 8...Also see...
        if line =~  /[#][#]*.* /x  || line =~ /^[\s]{0,}+[\*]+[\s]{1,}+(?!\[)/
          tag = line.split(/[ [#*][[\s]*[\*]{1}+[\s]+]]+/,2).last
          puts '---------------------------'
          puts "#{tag}"
          puts '---------------------------'
        elsif line =~ /^[\s]*[\*]+[\s]{1,}+[\[].*[\]]+[\s]{0,}+[\(](?!#).*/
          #TODO find the two See also & For resources... & see if same as 3 items below.
          #TODO find javacript framworks - the line below it. line above tizen header. line above linux header.
          title = line.split(/[\s]*[\[\]]+/,3)
          title.shift
          url = (title.last).split(/[[\] [\(] [\)*]]/,3)
          binding.pry
          url.shift
          author-extra = (url.last).split(/[\s]{0,}+[-]{1}+[\s]{0,}+[\w]+/ || /[\s]{0,}+[b]{1}+[y]{1}+[\s]{0,}+[\w]+/)
          author2 = (author-extra.last).split(/[\s]*[\(\[]+/)
        # binding.pry
          author = (author2.first).split(/^\w(?=[\\n])+/ || /^.*[\\n]+/) #TODO rm \n's fr authors w/o trailing chars.
            #TODO fix authors like "atariarchives..." & ", University..."
          puts "Book#{i}/1095+4: #{title.first}. url: #{url.first}. author: #{author.first}. Tag: #{tag}"
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

