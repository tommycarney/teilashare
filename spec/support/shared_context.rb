# frozen_string_literal: true

RSpec.shared_context 'with an initialized client' do
  let(:client) do
    Teilashare.new(
      token: ENV['TOKEN'],
      affiliate_id: ENV['AFFILIATE_ID'],
      api_secret: ENV['API_SECRET'],
      api_version: ENV['API_VERSION']
    )
  end
end
