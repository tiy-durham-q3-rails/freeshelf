class TagMailer < ActionMailer::Base
  default from: "freeshelf@freeshelf.com"

  def new_tag_alert(user, slug, tag)
    @user = user
    @slug = slug
    @tag = tag
    @url = "http://www.freeshelf.herokuapp.com/books/#{slug}"
    mail(to: @user.email, subject: "A New Book Was Added With Your Favorited Tag!")
  end
end
