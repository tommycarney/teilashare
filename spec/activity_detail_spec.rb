# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Activity Detail' do
  describe '#activity_details' do
    let(:example_row) do
      {
        'Trans ID' => '154945722',
        'User ID' => '123456789',
        'Merchant ID' => '84199',
        'Trans Date' => '01/03/2021 12:41:28 PM',
        'Trans Amount' => '138',
        'Commission' => '13.8',
        'Comment' => 'Sale - 15139',
        'Voided' => nil,
        'Pending Date' => nil,
        'Locked' => '1',
        'Aff Comment' => nil,
        'Banner Page' => nil,
        'Reversal Date' => nil,
        'Click Date' => '2021-01-03 00:00:00.0',
        'Click Time' => '12:38:39 PM',
        'Banner Id' => '1276948',
        'SKU List' => nil,
        'Quantity List' => nil,
        'Lock Date' => '2021-04-20',
        'Paid Date' => '2021-04-20',
        'Merchant Organization' => 'landsend;',
        'Merchant Website' => 'landsend.com/',
        'Trans Type' => 'Sale',
        'Merchant Defined Type' => nil,
        'Store ID' => nil,
        'Reference Trans' => nil
      }
    end

    let(:headers) { example_row.keys }
    let(:response) { client.activity_details(date_start: '01/01/2021') }

    it 'returns a parsed CSV of activity details with specified headers',
       vcr: 'activity_details' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of activity details with specified values', vcr: 'activity_details' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
