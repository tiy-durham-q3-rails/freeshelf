namespace :books do
  desc 'Rake task to get books data'
  task :readlocal => :environment do
    i = 1
    f = File.open(File.join("lib/tasks", "freeprogrammingbooks.md"),"r").each_line do |line|
      if line =~  /[#][#]*.* /x  || line =~ /^[\s]{0,}+[\*]+[\s]{1,}+(?!\[)/
        tag = line.split(/[ [#*][[\s]{0,}[\*]{1}+[\s]{1,}]]+/,2).last
        puts "---------------------------"
        puts "#{tag}"
        puts "---------------------------"
      elsif line =~ /^[\s]{0,}[\*]+[\s]{1,}+[\[].*[\]]+[\s]{0,}+[\(](?!#).*/
        #TODO find the two See also & For resources... & see if same as 3 items below.
        #TODO find javacript framworks - the line below it. line above tizen header. line above linux header.
        title = line.split(/[\s]{0,}[\[\]]+/,3)
        title.shift
        url = (title.last).split(/[[\]] [\(] [\)*]]/,3)
        binding.pry
        url.shift
        authorextra = (url.last).split(/[\s]{0,}+[-]{1}+[\s]{0,}+[\w]+.*/)
        author2 = (authorextra.last).split(/[\s]{0,}[\(\[]+/)
        # binding.pry
        author = (author2.first).split(/^\w(?=[\\n])+/ || /^.*[\\n]+/)
        #TODO remove \n's from authors w no trailing chars.
        # TODO splice last two chars if matches \n? -- #(author.first).gsub!(/.{2}$/,'')
        #TODO fix authors like "atariarchives..." & ", University..."
        puts "Title-#{i} of 1095 + 4: #{title.first}. url: #{url.first}. author: #{author.first}."

        i += 1
      elsif line =~ /^[\s].*/
        #puts "blank line"
      else
        puts "lost header##########################"
      end
    end
  end
end