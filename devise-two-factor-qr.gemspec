
$:.push File.expand_path('../lib', __FILE__)
require 'version'

Gem::Specification.new do |s|
  s.name        = 'devise-two-factor-qr'
  s.version     = Devise::TwoFactorQr::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.summary     = 'Devise second factor authentication with a QR code'
  s.email       = 'pavel.nabutovsky@quoininc.com'
  s.homepage    = 'https://github.com/pnabutovsky/devise-two-factor-qr'
  s.description = 'Devise second factor authentication with a QR code'
  s.authors     = ['Pavel Nabutovsky']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'railties',       '< 5.3'
  s.add_runtime_dependency 'activesupport',  '< 5.3'
  s.add_runtime_dependency 'devise',         '~> 4.0'

end
