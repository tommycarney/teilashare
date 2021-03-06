# frozen_string_literal: true

module Teilashare
  module Resources
    class MerchantSearchByProduct < APIResource
      def action_verb
        'merchantSearchProduct'
      end

      def required_opts
        [:keyword]
      end
    end
  end
end
