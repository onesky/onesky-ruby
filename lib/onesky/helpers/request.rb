require 'rest-client'

module Helpers
  module Request

    ENDPOINT = 'http://staging-platform.api.onesky.io'
    VERSION = 1

    protected

    def get(path, params = {})
      uri = uri_prefix + path
      RestClient.get uri, params: auth_hash.merge(params)
    rescue => error
      error.response
    end

    def post(path, body_hash)
      uri = uri_prefix + path
      RestClient.post uri, body_hash.to_json, content_type: :json, params: auth_hash
    rescue => error
      error.response
    end

    def post_multipart(path, body_hash)
      uri = uri_prefix + path
      RestClient.post uri, body_hash.merge({multipart: true}), params: auth_hash
    rescue => error
      error.response
    end

    def put(path, body_hash)
      uri = uri_prefix + path
      RestClient.put uri, body_hash.to_json, content_type: :json, params: auth_hash
    rescue => error
      error.response
    end

    def delete(path, params = {})
      uri = uri_prefix + path
      RestClient.delete uri, params: auth_hash.merge(params)
    rescue => error
      error.response
    end

    private

    def uri_prefix
      "#{ENDPOINT}/#{VERSION}"
    end

  end
end
