# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Today Stats' do
  describe '#today_stats' do
    let(:example_row) do
      { 'Merchant' => '83434-royalwool-royalwool.com',
        'Status' => 'yes',
        'Commissions' => '$0',
        'Unique Hits' => '2',
        'Sales' => '0',
        'Conversions' => '0%',
        'Reversals' => '0',
        'Manual Credits' => '0',
        'EPC' => '$0',
        'Last Page Clicked' => 'https://merinowoolrocks.com/',
        'Number Sales' => '0',
        'Number Leads' => '0',
        'Number TwoTier' => '0',
        'Number Bonuses' => '0',
        'Number PayPerCall' => '0',
        'Number LeapFrog' => '0',
        'Sale Commissions' => '$0',
        'Lead Commissions' => '$0',
        'TwoTier Commissions' => '$0',
        'Bonus Commissions' => '$0',
        'PayPerCall Commissions' => '$0',
        'LeapFrog Commissions' => '$0' }
    end

    let(:headers) { example_row.keys }
    let(:response) { client.today_stats }

    it 'returns a parsed CSV of today stats with specified headers', vcr: 'today_stats' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of today stats with specified values', vcr: 'today_stats' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
