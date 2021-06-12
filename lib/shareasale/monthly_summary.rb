# frozen_string_literal: true

module Shareasale
  class MonthlySummary < APIResource
    def action_verb
      'monthlySummary'
    end

    def required_opts
      [:date_month]
    end
  end
end
