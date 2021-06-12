# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Activity Summary' do
  describe '#activity_summary' do
    let(:example_row) do
      {
        'Merchant Id' => '83434',
        'Merchant' => 'TopCorp',
        'Commissions Month' => '56.7',
        'Commissions Total' => '3875.17',
        'Hits Month' => '149',
        'Hits Total' => '10210',
        'Sales Month' => '3',
        'Sales Total' => '312',
        'Conversion Month' => '2.013422818791',
        'Conversion Total' => '3.055827619980411',
        'Epc Month' => '38.05369',
        'Epc Total' => '37.95465',
        'Merchant Status' => 'Online',
        'Sale Comm.' => '10%',
        'Lead Comm.' => nil,
        'Hit Comm.' => nil,
        'NumberOfSalesMonth' => '3',
        'CommissionsSalesMonth' => '56.7',
        'NumberOfLeadsMonth' => '0',
        'CommissionsLeadsMonth' => '0.0',
        'NumberOfTwoTierMonth' => '0',
        'CommissionsTwoTierMonth' => '0.0',
        'NumberOfBonusesMonth' => '0',
        'CommissionsBonusMonth' => '0.0',
        'NumberOfPPCallsMonth' => '0',
        'CommissionsPPCallMonth' => '0.0',
        'NumberOfLeapfrogsMonth' => '0',
        'CommissionsLeapfrogMonth' => '0.0'
      }
    end
    let(:headers) { example_row.keys }
    let(:response) { client.activity_summary }

    it 'returns a parsed CSV of activity details with specified headers',
       vcr: 'activity_summary' do
      expect(response.headers).to include(*headers)
    end

    it 'returns a parsed CSV of activity details with specified values', vcr: 'activity_summary' do
      expect(response[0].to_h.values).to include(*example_row.values)
    end
  end
end
