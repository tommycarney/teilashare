# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Balance Inquiry' do
  describe '#balance_inquiry' do
    let(:example_row) do
      {"Balance"=>"367.7 "}
    end

    let(:headers) { example_row.keys }
    let(:response) { client.balance_inquiry }

    it 'returns a parsed CSV of ledger report with specified headers', vcr: 'balance_inquiry' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of ledger report with specified values', vcr: 'balance_inquiry' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
