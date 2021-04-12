class ImagesController < ApplicationController
  def index
  end

  def search
    @photos = flickr.photos.search(text: params[:text])

    render json: @photos
  end

  private

  def flickr
    @flickr ||= FlickRaw::Flickr.new
  end
end
