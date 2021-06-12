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
      ActivityDetail.new(self, opts).call
    end

    def activity_summary(opts = {})
      ActivitySummary.new(self, opts).call
    end

    def merchant_timespan(opts = {})
      MerchantTimespan.new(self, opts).call
    end

    def today_stats(opts = {})
      TodayStats.new(self, opts).call
    end

    def monthly_summary(opts = {})
      MonthlySummary.new(self, opts).call
    end

    def void_trail(opts = {})
      VoidTrail.new(self, opts).call
    end

    def traffic(opts = {})
      Traffic.new(self, opts).call
    end

    def api_token_count(opts = {})
      ApiTokenCount.new(self, opts).call
    end

    def products(opts = {})
      Products.new(self, opts).call
    end

    def invalid_links(opts = {})
      InvalidLinks.new(self, opts).call
    end

    def order_inquiry(opts = {})
      OrderInquiry.new(self, opts).call
    end

    def merchant_datafeed(opts = {})
      MerchantDatafeed.new(self, opts).call
    end

    def coupon_deal(opts = {})
      CouponDeal.new(self, opts).call
    end

    def merchant_status(opts = {})
      MerchantStatus.new(self, opts).call
    end

    def merchant_creative(opts = {})
      MerchantCreative.new(self, opts).call
    end

    def merchant_gift_card(opts = {})
      MerchantGiftCard.new(self, opts).call
    end

    def edit_trail(opts = {})
      EditTrail.new(self, opts).call
    end

    def payment_summary(opts = {})
      PaymentSummary.new(self, opts).call
    end

    def merchant_search(opts = {})
      MerchantSearch.new(self, opts).call
    end

    def merchant_search_by_product(opts = {})
      MerchantSearchByProduct.new(self, opts).call
    end

    def ledger_report(opts = {})
      LedgerReport.new(self, opts).call
    end

    def balance_inquiry(opts = {})
      BalanceInquiry.new(self, opts).call
    end
  end
end
