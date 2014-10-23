require 'spec_helper'

describe 'Helpers::Request' do

  let(:api_key) {''}
  let(:api_secret) {''}
  let(:client) {Onesky::Client.new(api_key, api_secret)}
  let(:project_id) {1}
  let(:project) {client.project(project_id)}

  describe '#get' do
    it 'should raise error for error response code' do
      stub_request(:get, full_path_with_auth_hash("/locales", api_key, api_secret))
        .to_return(status: 400, body: {meta: {code: 400, message: 'error message'}}.to_json)
      expect {client.list_locale}.to raise_error(Onesky::Errors::BadRequestError, '400 Bad Request - error message')
    end
  end

  describe '#post' do
    it 'should return response on error' do
      stub_request(:post, full_path_with_auth_hash("/project-groups", api_key, api_secret))
        .to_return(status: 400, body: {meta: {code: 400, message: 'error message'}}.to_json)
      expect {client.create_project_group({name: 'TEST'})}.to raise_error(Onesky::Errors::BadRequestError, '400 Bad Request - error message')
    end
  end

  describe '#post_multipart' do
    it 'should return response on error' do
      stub_request(:post, full_path_with_auth_hash("/projects/#{project_id}/files", api_key, api_secret))
        .to_return(status: 400, body: {meta: {code: 400, message: 'error message'}}.to_json)
      expect {project.upload_file({file: 'spec/fixture/en.yml', file_format: 'RUBY_YAML'})}.to raise_error(Onesky::Errors::BadRequestError, '400 Bad Request - error message')
    end
  end

  describe '#put' do
    it 'should return response on error' do
      stub_request(:put, full_path_with_auth_hash("/projects/#{project_id}", api_key, api_secret))
        .to_return(status: 400, body: {meta: {code: 400, message: 'error message'}}.to_json)
      expect {project.update({name: 'NEW NAME'})}.to raise_error(Onesky::Errors::BadRequestError, '400 Bad Request - error message')
    end
  end

  describe '#delete' do
    it 'should return response on error' do
      stub_request(:delete, full_path_with_auth_hash("/projects/#{project_id}", api_key, api_secret))
        .to_return(status: 400, body: {meta: {code: 400, message: 'error message'}}.to_json)
      expect {project.remove}.to raise_error(Onesky::Errors::BadRequestError, '400 Bad Request - error message')
    end
  end

end
