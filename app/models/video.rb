class Video < ApiRecord
  
  def thumbnail
    thumbnails&.first
  end

end