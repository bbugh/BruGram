class HashtagsController < ApplicationController
  def index
    @hashtags = Hashtag.all
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @hashtag = @photo.hashtags.create(hashtag_params)
    redirect_to photo_path(@photo)
  end

  def show
    @hashtag = Hashtag.find(params[:id])
  end

  private
    def hashtag_params
      params.require(:hashtag).permit(:text)
    end
end
