# frozen_string_literal: true

module Shareasale
  class Client
    attr_accessor :token, :api_secret, :affiliate_id, :api_version

    def initialize(opts)
      @token = opts[:token]
      @api_secret = opts[:api_secret]
      @affiliate_id = opts[:affiliate_id]
      @api_version = opts[:api_version] || default_api_version
    end

    def default_api_version
      2.3
    end

    def activity_details(opts = {})
      Resources::ActivityDetail.new(self, opts).call
    end

    def activity_summary(opts = {})
      Resources::ActivitySummary.new(self, opts).call
    end

    def merchant_timespan(opts = {})
      Resources::MerchantTimespan.new(self, opts).call
    end

    def today_stats(opts = {})
      Resources::TodayStats.new(self, opts).call
    end

    def monthly_summary(opts = {})
      Resources::MonthlySummary.new(self, opts).call
    end

    def void_trail(opts = {})
      Resources::VoidTrail.new(self, opts).call
    end

    def traffic(opts = {})
      Resources::Traffic.new(self, opts).call
    end

    def api_token_count(opts = {})
      Resources::ApiTokenCount.new(self, opts).call
    end

    def products(opts = {})
      Resources::Products.new(self, opts).call
    end

    def invalid_links(opts = {})
      Resources::InvalidLinks.new(self, opts).call
    end

    def order_inquiry(opts = {})
      Resources::OrderInquiry.new(self, opts).call
    end

    def merchant_datafeed(opts = {})
      Resources::MerchantDatafeed.new(self, opts).call
    end

    def coupon_deal(opts = {})
      Resources::CouponDeal.new(self, opts).call
    end

    def merchant_status(opts = {})
      Resources::MerchantStatus.new(self, opts).call
    end

    def merchant_creative(opts = {})
      Resources::MerchantCreative.new(self, opts).call
    end

    def merchant_gift_card(opts = {})
      Resources::MerchantGiftCard.new(self, opts).call
    end

    def edit_trail(opts = {})
      Resources::EditTrail.new(self, opts).call
    end

    def payment_summary(opts = {})
      Resources::PaymentSummary.new(self, opts).call
    end

    def merchant_search(opts = {})
      Resources::MerchantSearch.new(self, opts).call
    end

    def merchant_search_by_product(opts = {})
      Resources::MerchantSearchByProduct.new(self, opts).call
    end

    def ledger_report(opts = {})
      Resources::LedgerReport.new(self, opts).call
    end

    def balance_inquiry(opts = {})
      Resources::BalanceInquiry.new(self, opts).call
    end
  end
end
