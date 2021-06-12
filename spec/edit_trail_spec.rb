# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'Edit Trail' do
  describe '#edit_trail' do
    let(:headers) do
      ['TransID', 'EditDate', 'OriginalTransAmount', 'OriginalCommission', 'NewTransAmount',
       'NewCommission', 'AffComment ']
    end
    let(:response) { client.edit_trail(date_start: '1/1/2021') }

    it 'returns a parsed CSV of edit trail with specified headers',
       vcr: 'edit_trail' do
      expect(response.headers).to include(*headers)
    end
  end
end
