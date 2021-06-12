# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Invalid Links' do
  describe '#invalid_links' do
    let(:headers) do
      ['Invalid ID', 'Merchant ID', 'Banner ID', 'Referrer', 'Reason Code', 'Reason', 'Date',
       'Full Link', 'Afftrack ']
    end
    let(:response) { client.invalid_links }

    it 'returns a parsed CSV of api token count with specified headers', vcr: 'invalid_links' do
      expect(response.headers).to include(*headers)
    end
  end
end
