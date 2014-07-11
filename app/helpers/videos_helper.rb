module VideosHelper
  def video_embed(youtube_url)
    response = Oembedr.fetch(youtube_url)
    response.body["html"].html_safe
  end
  def video_thumb(youtube_url)
    response = Oembedr.fetch(youtube_url)
    response.body["thumbnail_url"]
  end
end
