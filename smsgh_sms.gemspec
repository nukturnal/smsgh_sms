# -*- encoding: utf-8 -*-
require File.expand_path('../lib/smsgh_sms/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alfred Rowe"]
  gem.email         = ["alfred@ncodedevlabs.com"]
  gem.description   = %q{This is a ruby wrapper that abstracts the SMSGH's SMS API. This gem has extra garnishing to make smsing via Ruby more tasteful and less painful.'}
  gem.summary       = %q{Send SMS via SMSGH's API}
  gem.homepage      = "https://github.com/nukturnal/smsgh_sms"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "smsgh_sms"
  gem.require_paths = ["lib"]
  gem.version       = SmsghSms::VERSION
  gem.add_dependency "curb-fu", "~> 0"
end
