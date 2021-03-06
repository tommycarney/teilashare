# frozen_string_literal: true

module Teilashare
  module Resources
    class ActivityDetail < APIResource
      def action_verb
        'activity'
      end

      def required_opts
        [:date_start]
      end
    end
  end
end
