module Resources
  module Project
    module Base

      def show
        get(project_path)
      end

      def remove
        delete(project_path)
      end

    end
  end
end
