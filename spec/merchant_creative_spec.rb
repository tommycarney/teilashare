# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Merchant Creative' do
  describe '#merchant_creative' do
    let(:example_row) do
      { 'Banner Id' => '1219962',
        'Name' => 'penguin Logo',
        'Image Url' => 'https://static.shareasale.com/image/68246/penguinlogoB.jpg',
        'Click Url' => 'https://www.shareasale.com/r.cfm?b=1219962&u=123456789&m=68246&urllink=&afftrack=',
        'Text' => nil,
        'Category' => 'Logo',
        'Image Width' => '1749',
        'Image Height' => '1749',
        'Alt Text' => 'penguin',
        'Modified Date' => '2018-07-30 18:27:29.813',
        'Merchant ID' => '68246',
        'Organization' => 'Penguin Corp',
        'WWW' => 'www.penguin.com' }
    end
    let(:headers) { example_row.keys }
    let(:response) { client.merchant_creative(merchant_id: 68_246) }

    it 'returns a parsed CSV of merchant creative with specified headers', vcr: 'merchant_creative' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of merchant creative with specified values', vcr: 'merchant_creative' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
