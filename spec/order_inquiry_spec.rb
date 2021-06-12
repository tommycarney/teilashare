# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Order Inquiry' do
  describe '#order_inquiry' do
    let(:example_row) do
      { 'result' => '5', 'transID' => '0 ' }
    end

    let(:headers) { example_row.keys }
    let(:response) do
      client.order_inquiry(
        order_date: '01/03/2021',
        order_number: '154945722',
        merchant_id: '84199'
      )
    end

    it 'returns a parsed CSV of order inquiry with specified headers', vcr: 'order_inquiry' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of order inquiry with specified values', vcr: 'order_inquiry' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
