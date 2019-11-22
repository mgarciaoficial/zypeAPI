class VideosController < ApplicationController
  PER_PAGE = 15

  before_action :fetch_videos

  def index
    
  end

  private

  def fetch_videos
    @videos = paginate_collection(Video.all(params: pagination_params))
  end

  def pagination_params
    {
      per_page: PER_PAGE,
      page: params[:page]
    }
  end
end
