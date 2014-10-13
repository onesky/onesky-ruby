require 'spec_helper'

describe 'Locale' do

  let(:client) {Onesky::Client.new('api_key', 'api_secret')}

  describe 'list_locale' do
    it 'should list all available locales' do
      stub_request(:get, 'https://staging-platform.api.onesky.io/1/locales')
        .to_return(body: {})
      response = client.list_locale
      expect(response).to be_an_instance_of(Hash)
    end
  end

end
