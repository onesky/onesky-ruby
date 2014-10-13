require 'spec_helper'

describe 'Project Group' do

  let(:client) {Onesky::Client.new('api_key', 'api_secret')}

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

end
