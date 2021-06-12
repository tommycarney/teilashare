# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Traffic' do
  describe '#traffic' do
    let(:example_row) do
      { 'merchantID' => '68246',
        'organization' => 'penguin, Inc',
        'website' => 'www.penguin.com',
        'uniqueHits' => '85',
        'Commissions' => '$48.30',
        'netSales' => '$321.97',
        'numberOfVoids' => '0',
        'numberOfSales' => '3',
        'conversion' => '3.53%',
        'epc' => '$56.82' }
    end

    let(:headers) { example_row.keys }
    let(:response) { client.traffic(date_start: '04/01/2021') }

    it 'returns a parsed CSV of traffic with specified headers', vcr: 'traffic' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of traffic with specified values', vcr: 'traffic' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
