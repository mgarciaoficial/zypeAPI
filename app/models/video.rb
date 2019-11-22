class Video < ApiRecord
  
  def id
    _id
  end
  
  def thumbnail
    thumbnails&.first
  end

  def duration_in_minutes
    duration / 1.minute
  end

  def source
    "https://player.zype.com/embed/#{id}.js?autoplay=true&a\r\npp_key=#{API_KEY}"
  end
end