# frozen_string_literal: true

require 'devise'
require 'devise_two_factor/models'
require 'devise_two_factor/strategies'

module Devise

  matrr_accessor :qr_bypass
  @@qr_bypass = false

end

Devise.add_module(:two_factor_qr_authenticatable,
  route: :session, strategy: true, controller: :sessions, model: true)