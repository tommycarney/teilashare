# frozen_string_literal: true

module Shareasale
  class VoidTrail < APIResource
    def action_verb
      'voidTrail'
    end

    def required_opts
      [:date_start]
    end
  end
end
