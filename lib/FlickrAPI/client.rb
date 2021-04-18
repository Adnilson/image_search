module FlickrAPI
  class Client
    API_ENDPOINT = 'https://api.flickr.com/services/rest/'.freeze

    def initialize
      @api_key = ENV['FLICKR_API_KEY']
    end

    def photos_search(text)
      request(
        method: 'flickr.photos.search',
        text: text
      )
    end

    private

    def request(extra_params)
      uri = URI(API_ENDPOINT)

      params = {
        api_key: @api_key,
        format: 'json',
        nojsoncallback: 1
      }

      uri.query = URI.encode_www_form(params.merge(extra_params))
      response_body = JSON.parse(Net::HTTP.get_response(uri).body)

      if response_body['stat'] == 'fail'
        Rails.logger.error("Flickr error! Code: #{response_body['code']}, message: #{response_body['message']}")
      end

      response_body['photos']['photo']
    end
  end
end
