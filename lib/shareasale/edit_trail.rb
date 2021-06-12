# frozen_string_literal: true

module Shareasale
  class EditTrail < APIResource
    def action_verb
      'edittrail'
    end

    def required_opts
      [:date_start]
    end
  end
end
