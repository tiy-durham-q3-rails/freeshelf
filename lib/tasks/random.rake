def random_title
  words = [Faker::Hacker.ingverb.capitalize,
           Faker::Hacker.adjective.capitalize,
           [Faker::Hacker.noun.capitalize, Faker::Hacker.abbreviation].sample]
  words.join(" ")
end

def tag
  Faker::Hacker.send([:ingverb, :adjective, :noun, :abbreviation].sample)
end

def tag_list
  tags = []
  rand(2..10).times { tags << tag }
  tags.join(", ")
end

namespace :random do
  desc "Generate random books"
  task :books, [:count] => :environment do |t, args|
    count = args[:count].to_i
    count = 10 if count <= 0

    count.times do
      title = random_title
      tempfile = Dir::Tmpname.create(['identicon', '.png']) { }
      Identicon.file_for(title, tempfile, 300, [255,255,255])

      Book.create!(:title => title,
                   :url => Faker::Internet.url,
                   :creator => Faker::Name.name,
                   :year_created => 2014 - Random.rand(0..30),
                   :tag_list => tag_list,
                   :cover => File.new(tempfile),
                   :description => Faker::Lorem.paragraph,
                   :user_id => User.first)
    end
  end

  desc "Generate random users"
  task :users, [:count] => :environment do |t, args|
    count = args[:count].to_i
    count = 10 if count <= 0

    count.times do
      User.create!(:name => Faker::Name.name,
                   :email => Faker::Internet.email,
                   :password => "password",
                   :password_confirmation => "password")
    end
  end
end
