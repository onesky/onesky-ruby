module Resources
  module Project
    module File

      def list_file
        get("#{project_path}/files")
      end

      def upload_file(params)
        file = params['file']
        if file.is_a? String
          params['file'] = File.new(file, 'rt')
        end

        post_multipart("#{project_path}/files", params)
      end

    end
  end
end
