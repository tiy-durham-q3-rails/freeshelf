module VideosHelper
  def video_edit_tag_link_to(video)
    link_to content_tag(:i, nil, class: 'fa fa-edit'), edit_tags_video_path(video), remote: true
  end

  def video_embed(video_url)
    return unless video_url
    response = Oembedr.fetch(video_url)
    response.body["html"].html_safe if response.try(:body).present?
  end

  def video_thumb(video_url)
    return unless video_url
    response = Oembedr.fetch(video_url)
    response.body["thumbnail_url"] if response.try(:body).present?
  end
end
