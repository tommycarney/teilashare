# frozen_string_literal: true

module Shareasale
  class Traffic < APIResource
    def action_verb
      'traffic'
    end

    def required_opts
      [:date_start]
    end
  end
end
