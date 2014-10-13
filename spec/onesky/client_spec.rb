require 'spec_helper'

describe Onesky::Client do

  let(:client) {Onesky::Client.new('api_key', 'api_secret')}

  it 'should able to set api_key, api_secret' do
    expect(client.api_key).to eq 'api_key'
    expect(client.api_secret).to eq 'api_secret'
  end

end
