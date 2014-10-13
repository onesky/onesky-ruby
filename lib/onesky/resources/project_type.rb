module Resources
  module ProjectType

    def list_project_type
      get('/project-type')
    end

  end
end
