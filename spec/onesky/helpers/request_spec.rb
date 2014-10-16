require 'spec_helper'

describe 'Helpers::Request' do

  let(:api_key) {''}
  let(:api_secret) {''}
  let(:client) {Onesky::Client.new(api_key, api_secret)}
  let(:project_id) {1}
  let(:project) {client.project(project_id)}

  describe '#get' do
    it 'should return response on error' do
      stub_request(:get, full_path_with_auth_hash("/locales", api_key, api_secret))
        .to_return(status: 401, body: {})
      response = client.list_locale
      expect(response.code).to eq(401)
    end
  end

  describe '#post' do
    it 'should return response on error' do
      stub_request(:post, full_path_with_auth_hash("/project-groups", api_key, api_secret))
        .to_return(status: 401, body: {})
      response = client.create_project_group({name: 'TEST'})
      expect(response.code).to eq(401)
    end
  end

  describe '#put' do
    it 'should return response on error' do
      stub_request(:put, full_path_with_auth_hash("/projects/#{project_id}", api_key, api_secret))
        .to_return(status: 401, body: {})
      response = project.update({name: 'NEW NAME'})
      expect(response.code).to eq(401)
    end
  end

  describe '#delete' do
    it 'should return response on error' do
      stub_request(:delete, full_path_with_auth_hash("/projects/#{project_id}", api_key, api_secret))
        .to_return(status: 401, body: {})
      response = project.remove
      expect(response.code).to eq(401)
    end
  end

end
