require 'onesky/resources/project/base'
require 'onesky/resources/project/file'
require 'onesky/resources/project/translation'
require 'onesky/resources/project/import_task'
require 'onesky/resources/project/quotation'
require 'onesky/resources/project/order'
require 'onesky/helpers/request'

module Onesky
  class Project

    include Resources::Project::Base
    include Resources::Project::File
    include Resources::Project::Translation
    include Resources::Project::ImportTask
    include Resources::Project::Quotation
    include Resources::Project::Order
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
