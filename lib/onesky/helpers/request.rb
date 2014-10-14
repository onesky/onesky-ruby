require 'digest'
require 'rest-client'

module Helpers
  module Request

    ENDPOINT = 'https://staging-platform.api.onesky.io'
    VERSION = 1

    protected

    def get(path)
      uri = uri_prefix + path
      RestClient.get uri, auth_hash
    end

    def post(path, body_hash)
      uri = uri_prefix + path
      RestClient.post uri, body_hash.to_json, content_type: :json, params: auth_hash
    end

    private

    def auth_hash
      now = Time.now.to_i

      {
        api_key: @api_key,
        timestamp: now,
        dev_hash: Digest::MD5.hexdigest(now.to_s + @api_secret)
      }
    end

    def uri_prefix
      "#{ENDPOINT}/#{VERSION}"
    end

  end
end
