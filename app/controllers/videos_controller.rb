class VideosController < ApplicationController
  PER_PAGE = 15

  before_action :fetch_videos, only: :index
  before_action :fetch_video, only: :show

  def index; end

  def show
    @title = @video&.title
  end

  private

  def fetch_videos
    @videos = paginate_collection(Video.all(params: pagination_params))
  end

  def fetch_video
    @video = Video.find(params[:id])
  end

  def pagination_params
    {
      per_page: PER_PAGE,
      page: params[:page]
    }
  end
end
