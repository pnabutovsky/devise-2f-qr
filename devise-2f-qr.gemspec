
$:.push File.expand_path('../lib', __FILE__)
require 'version'

Gem::Specification.new do |s|
  s.name        = 'devise-2f-qr'
  s.version     = Devise2fQr::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ['MIT']
  s.summary     = 'Devise second factor authentication with a QR code'
  s.email       = 'pavel.nabutovsky@quoininc.com'
  s.homepage    = 'https://github.com/pnabutovsky/devise-two-factor'
  s.description = 'Devise second factor authentication with a QR code'
  s.authors     = ['Pavel Nabutovsky']

  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'railties',       '< 5.3'
  s.add_runtime_dependency 'activesupport',  '< 5.3'
  s.add_runtime_dependency 'attr_encrypted', '>= 1.3', '< 4', '!= 2'
  s.add_runtime_dependency 'devise',         '~> 4.0'

  s.add_development_dependency 'activemodel'
  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'bundler',    '> 1.0'
  s.add_development_dependency 'rspec',      '> 3'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'faker'
  s.add_development_dependency 'timecop'
end