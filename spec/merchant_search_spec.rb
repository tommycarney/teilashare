# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Merchant Search' do
  describe '#merchant_search' do
    let(:example_row) do
      { 'Merchant Id' => '103574',
        'Organization' => 'Designer Dram, LLC',
        'WWW' => 'designerdram.com',
        'Category' => 'Food/Drink',
        'Status' => 'Not Applied',
        'Commission Text' => ' 10.00%  Per Sale',
        'Sale Comm' => '10.0',
        'Lead Comm' => '0.0',
        'Hit Comm' => '0.0',
        'Cookie Length' => '30',
        'Auto Approve' => 'No',
        'Auto Deposit' => '1',
        'Datafeed Items' => '0',
        'Epc 7 Day' => '152.69',
        'EPC 30 Day' => '245.81',
        'Reversal Rate 7 Day' => '0.0',
        'Reversal Rate 30 Day' => '0.0',
        'Ave Sale 7 Day' => '132.33',
        'Ave Sale 30 Day' => '128.18',
        'Ave Comm 7 Day' => '13.23',
        'Ave Comm 30 Day' => '12.82',
        'Powerrank Top 100' => 'No' }
    end
    let(:headers) { example_row.keys }
    let(:response) { client.merchant_search(keyword: 'whiskey') }

    it 'returns a parsed CSV of merchant search with specified headers', vcr: 'merchant_search' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of merchant search with specified values', vcr: 'merchant_search' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
