# frozen_string_literal: true

RSpec.describe Credentials do
  describe '.fetch' do
    context 'with an existing key' do
      it 'returns the value' do
        expect(described_class.fetch(:secret_key_base))
          .to eql 'super-secret-test-key-base'
      end
    end

    context 'with existing nested key' do
      it 'returns the value' do
        expect(described_class.fetch(:aws, :access_key_id))
          .to eql 'aws-access-key-id'
      end
    end

    context 'with existing deeper nested keys' do
      it 'returns the value' do
        expect(described_class.fetch(:recaptcha, :v2, :site_key))
          .to eql 'recaptcha-v2-site-key'
      end
    end

    context 'with a non-existing key' do
      it 'raises an error' do
        expect { described_class.fetch(:nonexistent) }.to raise_error(KeyError)
      end
    end
  end
end
