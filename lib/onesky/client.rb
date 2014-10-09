module Onesky
  class Client

    def self.test_print
      p 'This is Onesky::Client.test_print()'
    end

    attr_accessor :api_key, :api_secret, :project_id

    def initialize(key, secret, project_id = nil)
      @api_key = key
      @api_secret = secret
      @project_id = project_id
    end

  end
end
