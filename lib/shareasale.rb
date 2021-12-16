# frozen_string_literal: true

require 'active_support'
require 'active_support/all'
require 'faraday'
require 'json'
require 'time'

require 'shareasale/version'
require 'shareasale/parsers/csv_parser'
require 'shareasale/parsers/xml_parser'
require 'shareasale/parsers/pipe_parser'
require 'shareasale/errors'
require 'shareasale/request'
require 'shareasale/authentication'
require 'shareasale/client'
require 'shareasale/resources/api_resource'
require 'shareasale/resources/activity_detail'
require 'shareasale/resources/activity_summary'
require 'shareasale/resources/merchant_timespan'
require 'shareasale/resources/today_stats'
require 'shareasale/resources/monthly_summary'
require 'shareasale/resources/void_trail'
require 'shareasale/resources/traffic'
require 'shareasale/resources/api_token_count'
require 'shareasale/resources/products'
require 'shareasale/resources/invalid_links'
require 'shareasale/resources/order_inquiry'
require 'shareasale/resources/merchant_datafeed'
require 'shareasale/resources/coupon_deal'
require 'shareasale/resources/merchant_status'
require 'shareasale/resources/merchant_creative'
require 'shareasale/resources/merchant_gift_card'
require 'shareasale/resources/edit_trail'
require 'shareasale/resources/payment_summary'
require 'shareasale/resources/merchant_search'
require 'shareasale/resources/merchant_search_by_product'
require 'shareasale/resources/ledger_report'
require 'shareasale/resources/balance_inquiry'

module Shareasale
  def self.new(opts = {})
    required_opts = %i[token api_secret affiliate_id]
    missing_opts = required_opts.select { |opt| opts[opt].nil? }
    raise Shareasale::Errors::MissingCredentialsError, "Please provide #{missing_opts.join(', ')}" unless missing_opts.empty?

    Client.new(opts.with_indifferent_access)
  end
end
