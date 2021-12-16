# frozen_string_literal: true

require 'csv'

module Teilashare
  module Parsers
    class CsvParser
      def self.parse(input)
        CSV.parse(input, headers: true)
      end
    end
  end
end
