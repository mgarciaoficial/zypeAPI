class VideosController < ApplicationController

  def index
    @videos = Video.all(params: {per_page: 15})
  end

end
