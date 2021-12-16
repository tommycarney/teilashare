# frozen_string_literal: true

module Shareasale
  class Request
    attr_reader :client, :resource

    def initialize(client, resource)
      @client = client
      @resource = resource
    end

    def call
      connection.get(request_url) do |req|
        req.headers['x-Shareasale-Date'] = auth.date_string
        req.headers['x-Shareasale-Authentication'] = auth.hash
      end
    end

    private

    def request_url
      URI::HTTPS.build(host: Resources::APIResource::HOST, path: Resources::APIResource::PATH, query: resource_path).to_s
    end

    def resource_path
      URI.encode_www_form(camel_cased_opts)
    end

    def camel_cased_opts
      resource.opts.merge(required_opts).transform_keys { |k| k.to_s.camelize(:lower) }
    end

    def required_opts
      {
        version: client.api_version,
        action: resource.action_verb,
        affiliate_id: client.affiliate_id,
        token: client.token
      }
    end

    def auth
      @auth ||= Authentication.new(client, resource.action_verb)
    end

    def connection
      Faraday.new do |faraday|
        faraday.adapter Faraday::Adapter::NetHttp
      end
    end
  end
end
