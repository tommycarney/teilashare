# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Merchant Timespan' do
  describe '#merchant_timespan' do
    let(:example_row) do
      {
        'Merchant' => '83434-royalwool-royalwool.com',
        'Clicks' => '218',
        'Gross Sales' => '$1291',
        'Voids' => '0',
        'Net Sales' => '$1291',
        'Sales' => '6',
        'Manual Credits' => '0',
        'Commisssions' => '$129.1',
        'Conversion' => '2.752293577981',
        'EPC' => '59.2201834862',
        'Average Order' => '215.166666667',
        'Number Sales' => '6',
        'Number Leads' => '0',
        'Number TwoTier' => '0',
        'Number Bonuses' => '0',
        'Number PayPerCall' => '0',
        'Number LeapFrog' => '0',
        'Sale Commissions' => '$129.1',
        'Lead Commissions' => '$0',
        'TwoTier Commissions' => '$0',
        'Bonus Commissions' => '$0',
        'PayPerCall Commissions' => '$0',
        'LeapFrog Commissions' => '$0 '
      }
    end

    let(:headers) { example_row.keys }

    let(:response) do
      client.merchant_timespan(date_start: '01/01/2021', date_end: '01/31/2021',
                               merchant_id: '83434')
    end

    it 'returns a parsed CSV of activity details with specified headers',
       vcr: 'merchant_timespan' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of activity details with specified values',
       vcr: 'merchant_timespan' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
