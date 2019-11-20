class Video < ApiRecord
  
  def thumbnail
    thumbnails&.first
  end

  def duration_in_minutes
    duration / 1.minute
  end

end