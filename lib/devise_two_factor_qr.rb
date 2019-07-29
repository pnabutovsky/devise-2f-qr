# frozen_string_literal: true

require 'devise'
require 'devise_two_factor_qr/models'
require 'devise_two_factor_qr/strategies'

module Devise

  mattr_accessor :qr_bypass
  @@qr_bypass = false

end

Devise.add_module(:two_factor_qr_authenticatable,
  route: :session, strategy: true, controller: :sessions, model: true)