# frozen_string_literal: true

require 'csv'

module Shareasale
  class APIResource
    PATH = '/x.cfm'
    HOST = 'api.shareasale.com'

    attr_reader :client, :opts

    def initialize(client, opts = {})
      @client = client
      @opts = default_opts.merge(opts).with_indifferent_access
      validate_rquired_opts
    end

    ## TODO: allow for multipler parsers injected, handle errors gracefully
    def call
      response = Request.new(client, self).call
      raise Errors::InvalidRequestError, response.body if response.body.match?(/\AInvalid Request/)

      CSV.parse(response.body, headers: true)
    end

    def action_verb
      raise NotImplementedError, 'please define in a subclass'
    end

    private

    def validate_rquired_opts
      errors = []
      required_opts.each { |opt| errors << opt if opts[opt].nil? }
      return if errors.empty?

      raise ArgumentError, "#{errors.join(', ')} are missing"
    end

    def required_opts
      []
    end

    def default_opts
      {
        format: 'csv'
      }
    end
  end
end
