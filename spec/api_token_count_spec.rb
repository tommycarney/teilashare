# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'API Token Count' do
  describe '#api_token_count' do
    let(:example_row) do
      { 'creditsRemaining' => '176 ' }
    end

    let(:headers) { example_row.keys }
    let(:response) { client.api_token_count }

    it 'returns a parsed CSV of api token count with specified headers', vcr: 'api_token_count' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of api token count with specified values', vcr: 'api_token_count' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
