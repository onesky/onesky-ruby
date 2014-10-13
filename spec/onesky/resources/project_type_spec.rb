require 'spec_helper'

describe 'Project Type' do

  let(:client) {Onesky::Client.new('api_key', 'api_secret')}

  describe 'list_project_type' do
    it 'should list all available project type' do
      stub_request(:get, 'https://staging-platform.api.onesky.io/1/project-type')
        .to_return(body: {})
      response = client.list_project_type
      expect(response).to be_an_instance_of(Hash)
    end
  end

end
