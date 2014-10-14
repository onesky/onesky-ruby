require 'onesky/resources/project/base'
require 'onesky/helpers/request'

module Onesky
  class Project

    include Resources::Project::Base
    include Helpers::Request

    attr_accessor :client, :project_id

    def initialize(client, id)
      @client = client
      @project_id = id
    end

    private

    def project_path
      "/projects/#{@project_id}"
    end

    def auth_hash
      @client.auth_hash
    end

  end
end
