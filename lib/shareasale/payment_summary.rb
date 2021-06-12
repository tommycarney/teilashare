# frozen_string_literal: true

module Shareasale
  class PaymentSummary < APIResource
    def action_verb
      'paymentSummary'
    end

    def required_opts
      [:payment_date]
    end
  end
end
