require 'spec_helper'

describe 'Project::Base' do

  let(:api_key) {'api_key'}
  let(:api_secret) {'api_secret'}
  let(:client) {Onesky::Client.new(api_key, api_secret)}
  let(:project_id) {1}
  let(:project) {client.project(project_id)}

  describe 'show' do
    it 'should show project information' do
      stub_request(:get, full_path_with_auth_hash("/projects/#{project_id}", api_key, api_secret))
        .to_return(body: {})
      response = project.show
      expect(response).to be_an_instance_of(Hash)
    end
  end

end
