# frozen_string_literal: true

module Teilashare
  module Resources
    class Products < APIResource
      def action_verb
        'getProducts'
      end

      def required_opts
        [:keyword]
      end
    end
  end
end
