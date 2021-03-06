# frozen_string_literal: true

module Teilashare
  module Resources
    class PaymentSummary < APIResource
      def action_verb
        'paymentSummary'
      end

      def required_opts
        [:payment_date]
      end
    end
  end
end
