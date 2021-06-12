# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Products' do
  describe '#products' do
    let(:example_row) do
      { 'productId' => '1213935343',
        'Name' => "penguin Women's Wool Slip On Shoes, Dark Blue, Size 9",
        'Merchant Id' => '68246',
        'Organization' => 'Penguin Corp',
        'Link' => 'https://www.shareasale.com/m-pr.cfm?merchantID=68246&userID=1965836&productID=1213935343',
        'Thumbnail' => nil,
        'Big Image' =>
  'https://cdn.shopify.com/s/files/1/1104/4168/products/WL2MMST_SHOE_ANGLE_GLOBAL_MENS_WOOL_LOUNGER_2_STORM_BLUE_GREY.png?v=1621641518',
        'Price' => '95.0',
        'Retail Price' => nil,
        'Category' => '8',
        'Sub Category' => '61',
        'Description' => nil,
        'Custom 1' => "Women's",
        'Custom 2' => 'Storm',
        'Custom 3' => 'Wool Loungers',
        'Custom 4' => 'Shoes',
        'Custom 5' => nil,
        'Last Updated' => '2021-05-25 04:50:15.85',
        'Status' => 'instock',
        'Manufacture' => nil,
        'Part Number' => nil,
        'Merchant Category' => nil,
        'Merchant Sub Category' => nil,
        'Short Description' =>
  "Soft comfort in a smart silhouette that makes every experience a little more leisurely and a lot more cozy.  penguin Women's Wool Slip On Shoes, Storm, Size 9",
        'ISBN' => nil,
        'UPC' => nil,
        'SKU' => 'WL2WSTM090',
        'Cross Sell' => nil,
        'Merchant Group' => nil,
        'Merchant Sub Group' => nil,
        'Compatiable With' => nil,
        'Compare To' => nil,
        'Quantity Discount' => nil,
        'Best Seller' => '0',
        'Add to Cart URL' => nil,
        'Reviews URL' => nil,
        'Option 1' => nil,
        'Option 2' => nil,
        'Option 3' => nil,
        'Options 4' => nil,
        'Option 5' => nil,
        'ReservedForFutureUse' => nil,
        'WWW' => 'www.penguin.com',
        'Program Category' => 'Accessories',
        'Commission Text' => ' 15.00%  Per Sale',
        'Sale Comm' => '15.0',
        'Lead Comm' => '0.0',
        'Hit Comm' => '0.0',
        'Cookie Length' => '15',
        'Auto Approve' => 'No',
        'Auto Deposit' => '0',
        'Datafeed Items' => '3062',
        'Epc 7 Day' => '67.34',
        'EPC 30 Day' => '75.88',
        'Reversal Rate 7 Day' => '3.17',
        'Reversal Rate 30 Day' => '0.65',
        'Ave Sale 7 Day' => '117.99',
        'Ave Sale 30 Day' => '120.06',
        'Ave Comm 7 Day' => '16.94',
        'Ave Comm 30 Day' => '17.31',
        'Powerrank Top 100' => 'Yes',
        'Store Id' => '0' }
    end

    let(:headers) { example_row.keys }
    let(:response) { client.products(keyword: 'shoes') }

    it 'returns a parsed CSV of api token count with specified headers', vcr: 'products' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of api token count with specified values', vcr: 'products' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
