# frozen_string_literal: true

require 'csv'

module Teilashare
  module Parsers
    class PipeParser
      def self.parse(input)
        CSV.parse(input, headers: true, col_sep: '|')
      end
    end
  end
end
