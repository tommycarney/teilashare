# frozen_string_literal: true

module Teilashare
  module Errors
    class Error < StandardError; end

    class ConfigurationError < Error; end

    class MissingCredentialsError < Error; end

    class InvalidRequestError < Error; end
  end
end
