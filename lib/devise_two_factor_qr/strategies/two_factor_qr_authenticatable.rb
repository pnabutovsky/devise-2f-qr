# frozen_string_literal: true

module Devise
  module Strategies
    class TwoFactorQrAuthenticatable < Devise::Strategies::DatabaseAuthenticatable

      def authenticate!
        resource = mapping.to.find_for_database_authentication(authentication_hash)
        # We authenticate in two cases:
        # 1. The password and the code are correct
        # 2. The password is correct, and the second code is not required for login
        # We check the OTP, then defer to DatabaseAuthenticatable
        if validate(resource) { validate_code(resource) }
          super
        end

        fail(Devise.paranoid ? :invalid : :not_found_in_database) unless resource

        # We want to cascade to the next strategy if this one fails,
        # but database authenticatable automatically halts on a bad password
        @halted = false if @result == :failure
      end

      def validate_code(resource)
         return true unless resource.two_factor_required_for_login
         return if params[scope]['two_factor_code'].nil?
         resource.valid_two_factor_code?(params[scope]['two_factor_code'])
        true
      end

    end
  end
end

Warden::Strategies.add(:two_factor_qr_authenticatable, Devise::Strategies::TwoFactorQrAuthenticatable)