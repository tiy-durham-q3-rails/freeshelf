json.array!(@videos) do |video|
  json.extract! video, :id, :title, :contributor, :summary, :link
  json.url video_url(video, format: :json)
end
