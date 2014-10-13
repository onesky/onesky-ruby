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

end
