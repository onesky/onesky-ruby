require 'onesky'

describe Onesky::Client do

  it 'should able to set api_key, api_secret' do
    client = Onesky::Client.new('api_key', 'api_secret')

    expect(client.api_key).to eq 'api_key'
    expect(client.api_secret).to eq 'api_secret'
  end

end
