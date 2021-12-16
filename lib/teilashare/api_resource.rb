# frozen_string_literal: true

module Teilashare
  class APIResource
    PATH = '/x.cfm'
    HOST = 'api.shareasale.com'

    attr_reader :client, :opts

    def initialize(client, opts = {})
      @client = client
      @opts = default_opts.merge(opts).with_indifferent_access
      validate_required_opts
    end

    def call
      response = Request.new(client, self).call
      # the API returns 200 OK on invalid authentication GET requests, so need to parse error from body instead
      raise Errors::InvalidRequestError, response.body if response.body.match?(/\AInvalid Request/)

      parser.parse(response.body)
    end

    def action_verb
      raise NotImplementedError, 'please define in a subclass'
    end

    private

    def validate_required_opts
      missing_opts = []
      required_opts.each { |opt| missing_opts << opt if opts[opt].nil? }
      return if missing_opts.empty?

      raise ArgumentError, "#{missing_opts.join(', ')} are missing"
    end

    def required_opts
      []
    end

    def parser
      case @opts[:format]
      when 'csv'
        Parsers::CsvParser
      when 'xml'
        Parsers::XmlParser
      when 'pipe'
        Parsers::PipeParser
      else
        raise Teilashare::Errors::UnsupportedFormat, "Format: #{@opts[:format]} not supported."
      end
    end

    def default_opts
      {
        format: 'csv'
      }
    end
  end
end
