# frozen_string_literal: true

module Teilashare
  module Resources
    class TodayStats < APIResource
      def action_verb
        'dailyActivity'
      end
    end
  end
end
