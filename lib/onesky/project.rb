module Onesky
  class Project

    attr_accessor :client, :project_id

    def initialize(client, id)
      @client = client
      @project_id = id
    end

  end
end
