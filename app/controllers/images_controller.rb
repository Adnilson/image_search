class ImagesController < ApplicationController
  def index
  end

  def search
    @photos = flickr_api.photos_search(params[:text])

    render json: @photos
  end

  private

  def flickr_api
    @flickr_api ||= FlickrAPI::Client.new
  end
end
