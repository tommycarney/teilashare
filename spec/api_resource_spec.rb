require 'spec_helper'

RSpec.describe Shareasale::APIResource do
  let(:client) { double(:client) }

  describe 'required opts validations' do
    context 'when required opts missing' do
      it 'raises an ArgumentError error' do
        expect { Shareasale::ActivityDetail.new(client, {}) }.to raise_error(ArgumentError, 'date_start are missing')
      end
    end
  end
end