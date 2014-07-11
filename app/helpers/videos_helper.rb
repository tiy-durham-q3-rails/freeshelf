module VideosHelper
  def youtube_embed(youtube_url)
    response = Oembedr.fetch(youtube_url)
    response.body
  end
end
