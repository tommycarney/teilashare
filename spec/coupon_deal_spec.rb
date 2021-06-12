# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Coupon Deal' do
  describe '#coupon_deal' do
    let(:headers) do
      ['Deal Id',
       'Merchant Id',
       'Merchant',
       'Start Date',
       'End Date',
       'Publish Date',
       'Title',
       'BigImage',
       'Tracking URL',
       'SmallImage',
       'Category',
       'Description',
       'Restrictions',
       'Keywords',
       'Coupon Code',
       'Edit Date',
       'Store Id ']
    end
    let(:response) { client.coupon_deal }

    it 'returns a parsed CSV of order inquiry with specified headers', vcr: 'coupon_deal' do
      expect(response.headers).to include(*headers)
    end
  end
end
