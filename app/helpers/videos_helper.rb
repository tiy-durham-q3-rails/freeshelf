module VideosHelper
  def video_embed(youtube_url)
    response = Oembedr.fetch(youtube_url)
    response.body["html"].html_safe if response.respond_to?(:body)
  end

  def video_thumb(youtube_url)
    return unless youtube_url
    response = Oembedr.fetch(youtube_url)
    response.body["thumbnail_url"] if response.respond_to?(:body)
  end
end
