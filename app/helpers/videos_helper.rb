module VideosHelper
  def video_edit_tag_link_to(video)
    link_to content_tag(:i, nil, class: 'fa fa-edit'), edit_tags_video_path(video), remote: true
  end

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
