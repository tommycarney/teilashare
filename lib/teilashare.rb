# frozen_string_literal: true

require 'active_support'
require 'active_support/all'
require 'faraday'
require 'json'
require 'time'

require 'teilashare/version'
require 'teilashare/parsers/csv_parser'
require 'teilashare/parsers/xml_parser'
require 'teilashare/parsers/pipe_parser'
require 'teilashare/errors'
require 'teilashare/request'
require 'teilashare/authentication'
require 'teilashare/client'
require 'teilashare/resources/api_resource'
require 'teilashare/resources/activity_detail'
require 'teilashare/resources/activity_summary'
require 'teilashare/resources/merchant_timespan'
require 'teilashare/resources/today_stats'
require 'teilashare/resources/monthly_summary'
require 'teilashare/resources/void_trail'
require 'teilashare/resources/traffic'
require 'teilashare/resources/api_token_count'
require 'teilashare/resources/products'
require 'teilashare/resources/invalid_links'
require 'teilashare/resources/order_inquiry'
require 'teilashare/resources/merchant_datafeed'
require 'teilashare/resources/coupon_deal'
require 'teilashare/resources/merchant_status'
require 'teilashare/resources/merchant_creative'
require 'teilashare/resources/merchant_gift_card'
require 'teilashare/resources/edit_trail'
require 'teilashare/resources/payment_summary'
require 'teilashare/resources/merchant_search'
require 'teilashare/resources/merchant_search_by_product'
require 'teilashare/resources/ledger_report'
require 'teilashare/resources/balance_inquiry'

module Teilashare
  def self.new(opts = {})
    required_opts = %i[token api_secret affiliate_id]
    missing_opts = required_opts.select { |opt| opts[opt].nil? }
    raise Teilashare::Errors::MissingCredentialsError, "Please provide #{missing_opts.join(', ')}" unless missing_opts.empty?

    Client.new(opts.with_indifferent_access)
  end
end
