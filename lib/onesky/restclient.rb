# Monkey patching RestClient::Request.process_url_params
# To support array in URL params
# RestClient.get('http://www.example.com', params: {weekday: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri']})
# => GET http://www.example.com?weekday[]=Mon&weekday[]=Tue&weekday[]=Wed&weekday[]=Thu&weekday[]=Fri

module RestClient
  class Request

    def process_url_params url, headers
      url_params = {}
      headers.delete_if do |key, value|
        if 'params' == key.to_s.downcase && value.is_a?(Hash)
          url_params.merge! value
          true
        else
          false
        end
      end
      unless url_params.empty?
        query_string = url_params.collect { |k, v| build_url_params(k, v) }.join('&')
        url + "?#{query_string}"
      else
        url
      end
    end

    private

    def build_url_params key, value
      if value.is_a?(Array)
        value.map { |v| "#{key.to_s}[]=#{CGI::escape(v.to_s)}" }.join('&')
      else
        "#{key.to_s}=#{CGI::escape(value.to_s)}"
      end
    end

  end
end
