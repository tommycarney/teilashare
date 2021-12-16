# frozen_string_literal: true

module Shareasale
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
