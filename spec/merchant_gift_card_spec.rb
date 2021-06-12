# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Merchant Giftcard' do
  describe '#merchant_gift_card' do
    let(:headers) do
      ['Gift Card Id',
       'Merchant Id',
       'Merchant Name',
       'Publish Date',
       'Title',
       'BigImage',
       'Tracking Url',
       'SmallImage',
       'Category',
       'Description',
       'Restrictions',
       'Keywords',
       'Value',
       'Edit Date ']
    end
    let(:response) { client.merchant_gift_card }

    it 'returns a parsed CSV of merchant giftcard with specified headers',
       vcr: 'merchant_giftcard' do
      expect(response.headers).to include(*headers)
    end
  end
end
