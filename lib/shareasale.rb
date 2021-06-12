# frozen_string_literal: true

require 'active_support'
require 'active_support/all'
require 'faraday'
require 'json'
require 'time'


require 'shareasale/version'
require 'shareasale/errors'
require 'shareasale/request'
require 'shareasale/authentication'
require 'shareasale/client'
require 'shareasale/api_resource'
require 'shareasale/activity_detail'
require 'shareasale/activity_summary'
require 'shareasale/merchant_timespan'
require 'shareasale/today_stats'
require 'shareasale/monthly_summary'
require 'shareasale/void_trail'
require 'shareasale/traffic'
require 'shareasale/api_token_count'
require 'shareasale/products'
require 'shareasale/invalid_links'
require 'shareasale/order_inquiry'
require 'shareasale/merchant_datafeed'
require 'shareasale/coupon_deal'
require 'shareasale/merchant_status'
require 'shareasale/merchant_creative'
require 'shareasale/merchant_gift_card'
require 'shareasale/edit_trail'
require 'shareasale/payment_summary'
require 'shareasale/merchant_search'
require 'shareasale/merchant_search_by_product'
require 'shareasale/ledger_report'
require 'shareasale/balance_inquiry'

module Shareasale
  def self.new(opts={})
    required_opts = %i[token api_secret affiliate_id]
    missing_opts = required_opts.select { |opt| opts[opt].nil? }
    raise Shareasale::Errors::MissingCredentialsError, "Please provide #{missing_opts.join(', ')}" unless missing_opts.empty?

    Client.new(opts.with_indifferent_access)
  end
end
