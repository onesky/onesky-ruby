module Resources
  module ProjectGroup

    def list_project_group
      get('/project-groups')
    end

    def show_project_group(project_group_id)
      get("/project-groups/#{project_group_id}")
    end

  end
end
