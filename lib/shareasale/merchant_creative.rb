# frozen_string_literal: true

module Shareasale
  class MerchantCreative < APIResource
    def initialize(client, opts = {})
      super(client, opts)

      ## TODO: handle the conditional params requirements
    end

    def action_verb
      'merchantCreative'
    end
  end
end
