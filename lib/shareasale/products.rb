# frozen_string_literal: true

module Shareasale
  class Products < APIResource
    def action_verb
      'getProducts'
    end

    def required_opts
      [:keyword]
    end
  end
end
