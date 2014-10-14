require 'spec_helper'

describe 'Project Group' do

  let(:api_key) {'api_key'}
  let(:api_secret) {'api_secret'}
  let(:client) {Onesky::Client.new(api_key, api_secret)}

  describe 'list_project_group' do
    it 'should list all available project group' do
      stub_request(:get, 'https://staging-platform.api.onesky.io/1/project-groups')
        .to_return(body: {})
      response = client.list_project_group
      expect(response).to be_an_instance_of(Hash)
    end
  end

  describe 'show_project_group' do
    it 'should show a project group information' do
      stub_request(:get, 'https://staging-platform.api.onesky.io/1/project-groups/1')
        .to_return(body: {})
      response = client.show_project_group(1)
      expect(response).to be_an_instance_of(Hash)
    end
  end

  describe 'create_project_group' do
    let(:params) {{name: 'New Project Group'}}

    it 'should create a project group' do
      stub_request(:post, full_path_with_auth_hash('/project-groups', api_key, api_secret))
        .with(body: params.to_json, headers: {'Content_Type' => 'application/json'})
        .to_return(body: {})
      response = client.create_project_group(params)
      expect(response).to be_an_instance_of(Hash)
    end
  end

end
