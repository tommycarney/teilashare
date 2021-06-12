# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Merchant Status' do
  describe '#merchant_status' do
    let(:example_row) do
      { 'Merchant Id' => '68246',
        'Merchant' => 'penguin, Inc',
        'WWW' => 'www.penguin.com',
        'Program Status' => 'Online',
        'Program Category' => 'acc,clo,spf',
        'Sale Comm' => '15%',
        'Lead Comm' => nil,
        'Hit Comm' => nil,
        'Approved' => 'Yes',
        'Link Url' => 'https://www.shareasale.com/r.cfm?b=923405&u=1965836&m=68246',
        'Store Names' =>
    'www.penguin.com,www.penguin.ca,www.penguin.com.au,www.penguin.co.nz,www.penguin.co.uk,www.penguin.eu',
        'Store Ids' => '1,2,3,4,5,6',
        'Store WWWs' =>
    'www.penguin.com,www.penguin.ca,www.penguin.com.au,www.penguin.co.nz,www.penguin.co.uk,www.penguin.eu',
        'Store Sale Comms' => '15%,15%,15%,15%,15%,15%',
        'Store Link Urls' =>
    'https://www.shareasale.com/r.cfm?b=1404924&u=1965836&m=68246,https://www.shareasale.com/r.cfm?b=923405&u=1965836&m=68246,https://www.shareasale.com/r.cfm?b=0&u=1965836&m=68246,https://www.shareasale.com/r.cfm?b=0&u=1965836&m=68246,https://www.shareasale.com/r.cfm?b=0&u=1965836&m=68246,https://www.shareasale.com/r.cfm?b=0&u=1965836&m=68246',
        'ruleCommissionDate' => '2019-09-24 10:44:28',
        'conversionLineDate' => '2020-10-26 15:50:37',
        'Ships To' => 'AU,CA,NZ,GB,US' }
    end
    let(:headers) { example_row.keys }
    let(:response) { client.merchant_status }

    it 'returns a parsed CSV of order inquiry with specified headers', vcr: 'merchant_status' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of order inquiry with specified values', vcr: 'merchant_status' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
