# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Merchant Search by products' do
  describe '#merchant_search_by_product' do
    let(:example_row) do
      { 'productId' => '588337865',
        'Name' => 'Trust Me Youre Hilarious -Whiskey',
        'Price' => '20.0',
        'SKU' => '94926-tr401atk',
        'Thumbnail' =>
  'http://www.lookhuman.com/render/product/0906/0906447606022304/tr401atk-w232h232z1-94926-trust-me-youre-hilarious-whiskey.jpg',
        'Merchant Id' => '58636',
        'Organization' => 'Print Syndicate LLC',
        'WWW' => 'www.lookhuman.com',
        'Category' => 'Clothing',
        'Status' => 'Not Applied',
        'Commission Text' => ' 1.00%  Per Sale',
        'Sale Comm' => '1.0',
        'Lead Comm' => '0.0',
        'Hit Comm' => '0.0',
        'Cookie Length' => '30',
        'Auto Approve' => 'No',
        'Auto Deposit' => '0',
        'Datafeed Items' => '59990',
        'Epc 7 Day' => '0.26',
        'EPC 30 Day' => '1.28',
        'Reversal Rate 7 Day' => '0.0',
        'Reversal Rate 30 Day' => '0.0',
        'Ave Sale 7 Day' => '23.31',
        'Ave Sale 30 Day' => '40.54',
        'Ave Comm 7 Day' => '0.23',
        'Ave Comm 30 Day' => '0.72',
        'Powerrank Top 100' => 'No' }
    end
    let(:headers) { example_row.keys }
    let(:response) { client.merchant_search_by_product(keyword: 'whiskey') }

    it 'returns a parsed CSV of merchant search by products with specified headers',
       vcr: 'merchant_search_by_product' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of merchant search by products with specified values',
       vcr: 'merchant_search_by_product' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
