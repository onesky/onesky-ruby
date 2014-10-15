require 'spec_helper'

describe 'Project::File' do

  let(:api_key) {'api_key'}
  let(:api_secret) {'api_secret'}
  let(:client) {Onesky::Client.new(api_key, api_secret)}
  let(:project_id) {1}
  let(:project) {client.project(project_id)}

  describe 'list_file' do
    it 'should list files in project' do
      stub_request(:get, full_path_with_auth_hash("/projects/#{project_id}/files", api_key, api_secret))
        .to_return(body: {})
      response = project.list_file
      expect(response).to be_an_instance_of(Hash)
    end
  end

  describe 'upload_file' do
    let(:params) {{file: 'fixture/en.yml', file_format: 'RUBY_YAML'}}

    it 'should upload file to project' do
      stub_request(:post, full_path_with_auth_hash("/projects/#{project_id}/files", api_key, api_secret))
        .to_return(body: {})
      response = project.upload_file(params)
      expect(response).to be_an_instance_of(Hash)
    end
  end

end
