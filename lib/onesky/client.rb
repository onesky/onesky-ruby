require 'onesky/resources/locale'
require 'onesky/resources/project_type'
require 'onesky/resources/project_group'
require 'onesky/resources/project'
require 'onesky/helpers/request'
require 'onesky/project'

module Onesky
  class Client
    include Resources::Locale
    include Resources::ProjectType
    include Resources::ProjectGroup
    include Resources::Project
    include Helpers::Request

    def self.test_print
      p 'This is Onesky::Client.test_print()'
    end

    attr_accessor :api_key, :api_secret, :project_id

    def initialize(key, secret)
      @api_key = key
      @api_secret = secret
    end

  end
end
