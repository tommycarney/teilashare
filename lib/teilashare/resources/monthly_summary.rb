# frozen_string_literal: true

module Teilashare
  module Resources
    class MonthlySummary < APIResource
      def action_verb
        'monthlySummary'
      end

      def required_opts
        [:date_month]
      end
    end
  end
end
