class TagMailer < ActionMailer::Base
  default from: "freeshelf@freeshelf.com"

  def new_tag_alert(user, slug, tag)
    @user = user
    @slug = slug
    @tag = tag
    @url = book_url(id: slug)
    mail to: @user.email, subject: "[Freeshelf] A new book was added to the \"#{@tag}\" tag"
  end
end
