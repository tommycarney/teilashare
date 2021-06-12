# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Merchant Datafeed' do
  describe '#merchant_datafeed' do
    let(:example_row) do
      { 'Merchant ID' => '68246',
        'Merchant' => 'Penguin Corp',
        'Apply Status' => 'Approved',
        'FTP Status' => '0',
        'Number of Products' => '3062',
        'Last Updated' => '06/20/2021' }
    end
    let(:headers) { example_row.keys }
    let(:response) { client.merchant_datafeed }

    it 'returns a parsed CSV of order inquiry with specified headers', vcr: 'merchant_datafeed' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of order inquiry with specified values', vcr: 'merchant_datafeed' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
