# frozen_string_literal: true

module Devise
  module Models
    module TwoFactorQrAuthenticatable
      extend ActiveSupport::Concern
      include Devise::Models::DatabaseAuthenticatable

      included do
        attr_reader :two_factor_code
      end

      def two_factor_code=(code)
        @two_factor_code = code
        self.two_factor_code_encrypted = password_digest(@two_factor_code) if @two_factor_code.present?
      end

      def valid_two_factor_code?(code)
        Devise::Encryptor.compare(self.class, self.two_factor_code_encrypted, code)
      end

      def generate_two_factor_code
        #TODO: generate 256 bit code, encode base64
      end

    end
  end
end
