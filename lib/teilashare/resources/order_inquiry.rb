# frozen_string_literal: true

module Teilashare
  module Resources
    class OrderInquiry < APIResource
      def action_verb
        'orderInquiry'
      end

      def required_opts
        %i[order_date order_number merchant_id]
      end
    end
  end
end
