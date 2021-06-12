# frozen_string_literal: true

module Shareasale
  class OrderInquiry < APIResource
    def action_verb
      'orderInquiry'
    end

    def required_opts
      [:order_date, :order_number, :merchant_id]
    end
  end
end
