# frozen_string_literal: true

module Teilashare
  module Resources
    class Traffic < APIResource
      def action_verb
        'traffic'
      end

      def required_opts
        [:date_start]
      end
    end
  end
end
