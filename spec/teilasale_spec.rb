# frozen_string_literal: true

RSpec.describe Teilashare do
  it 'has a version number' do
    expect(Teilashare::VERSION).not_to be nil
  end

  context 'authentication' do
    context 'when missing' do
      it 'raises a MissingCredentialsError error' do 
        expect { Teilashare.new({}).today_stats }.to raise_error(Teilashare::Errors::MissingCredentialsError)
      end
    end

    context 'when incorrect' do
      let(:authentication) do
        {
          token: 'a-very-nice-token-but-sadly-wrong',
          api_secret: 'very-secret-but-not-correct',
          affiliate_id: '123456'
        }
      end

      it 'raises an InvalidRequestError', vcr: 'invalid-auth' do 
        expect { Teilashare.new(authentication).today_stats }.to raise_error(Teilashare::Errors::InvalidRequestError)
      end
    end
  end
end
