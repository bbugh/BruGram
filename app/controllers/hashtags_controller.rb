class HashtagsController < ApplicationController
  def index
    @hashtags = Hashtag.all.order(:text)
  end

  def show
    @hashtag = Hashtag.includes(:photos).find(params[:id])
  end
end
