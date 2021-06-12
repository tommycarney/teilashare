# frozen_string_literal: true

module Shareasale
  class Authentication
    attr_reader :client, :action_verb

    def initialize(client, action_verb)
      @client = client
      @action_verb = action_verb
    end

    def hash
      Digest::SHA256.hexdigest(authentication_string).upcase
    end

    def date_string
      date.strftime('%a, %d %b %Y %H:%M:%S GMT')
    end

    private

    def authentication_string
      "#{client.token}:#{date_string}:#{action_verb}:#{client.api_secret}"
    end

    def date
      @date ||= Time.now.utc
    end
  end
end
