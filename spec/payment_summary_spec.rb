# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Payment Summary' do
  describe '#payment_summary' do
    let(:example_row) do
      { 'Merchant Id' => '97294',
        'Merchant' => 'Freedom Merino Inc',
        'Website' => 'www.Freedommerino.com',
        'Number of Transactions' => '5',
        'Net Sales' => '1100.92',
        'Commissions' => '110.09' }
    end
    let(:headers) { example_row.keys }
    let(:response) { client.payment_summary(payment_date: '04/20/2021') }

    it 'returns a parsed CSV of merchant creative with specified headers',
       vcr: 'payment_summary' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of merchant creative with specified values', vcr: 'payment_summary' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
