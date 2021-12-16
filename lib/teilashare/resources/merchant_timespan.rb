# frozen_string_literal: true

module Teilashare
  module Resources
    class MerchantTimespan < APIResource
      def action_verb
        'merchantTimespan'
      end

      def required_opts
        [:date_start]
      end
    end
  end
end
