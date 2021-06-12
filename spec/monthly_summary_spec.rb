# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Monthly Summary' do
  describe '#monthly_summary' do
    let(:example_row) do
      { 'Merchant Id' => '68246',
        'Merchant' => 'Penguin Corp',
        'Website' => 'www.penguin.com',
        'Transaction In Period' => '4',
        'Voids In Period' => '0',
        'Gross Sales Amount' => '504.21000000000004',
        'Total Commision in Period' => '75.63' }
    end

    let(:headers) { example_row.keys }
    let(:response) { client.monthly_summary(date_month: '05/01/2021') }

    it 'returns a parsed CSV of today stats with specified headers', vcr: 'monthly_summary' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of today stats with specified values', vcr: 'monthly_summary' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
