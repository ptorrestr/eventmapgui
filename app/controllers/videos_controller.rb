class VideosController < ApplicationController
  def index
    @videos = Video.all.paginate(:per_page => 10, :page => params[:page])
    if params.has_key?(:page)
      @change = params[:page]
    end
  end

  def new
  end
end
