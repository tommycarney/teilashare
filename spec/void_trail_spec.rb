# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Void Trail' do
  describe '#void_trail' do
    let(:example_row) do
      { 'TransID' => '158083913',
        'VoidDate' => '2021-04-19 13:17:09.207',
        'VoidReason' => 'Returned Merchandise',
        'TransAmount' => '128.0',
        'Commission' => '12.8',
        'AffComment' => nil }
    end

    let(:headers) { example_row.keys }
    let(:response) { client.void_trail(date_start: '04/01/2021') }

    it 'returns a parsed CSV of today stats with specified headers', vcr: 'void_trail' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of today stats with specified values', vcr: 'void_trail' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
