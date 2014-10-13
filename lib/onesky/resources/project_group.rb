module Resources
  module ProjectGroup

    def list_project_group
      get('/project-groups')
    end

  end
end
