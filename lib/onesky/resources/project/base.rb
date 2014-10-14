module Resources
  module Project
    module Base

      def show
        get(project_path)
      end

      def update(params)
        put(project_path, params)
      end

      def remove
        delete(project_path)
      end

    end
  end
end
