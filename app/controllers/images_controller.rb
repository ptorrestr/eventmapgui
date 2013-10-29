class ImagesController < ApplicationController
  def index
    @images = Image.all.paginate(:per_page => 10, :page => params[:page])
    if params.has_key?(:page)
      @change = params[:page]
    end
  end
end
