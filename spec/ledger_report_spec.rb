# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Ledger Report' do
  describe '#ledger_report' do
    let(:example_row) do
      { 'ledgerid' => 'T-163559639',
        'action' => 'Payment',
        'dt' => '06/20/2021 02:15:00 AM',
        'transid' => '163559639',
        'transtype' => 'Affiliate Payment',
        'impact' => '-184.65',
        'afftrack' => nil,
        'comment' => 'Payment 5/1 - 5/31 Commissions - ACH Deposit Sent June 20',
        'merchantid' => '47',
        'storeid' => nil }
    end

    let(:headers) { example_row.keys }
    let(:response) { client.ledger_report }

    it 'returns a parsed CSV of ledger report with specified headers', vcr: 'ledger_report' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of ledger report with specified values', vcr: 'ledger_report' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
