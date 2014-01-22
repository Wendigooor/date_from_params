# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_from_params/version'

Gem::Specification.new do |spec|
  spec.name          = "date_from_params"
  spec.version       = DateFromParams::VERSION
  spec.authors       = ["Pavel Astraukh"]
  spec.email         = ["paladin111333@yandex.ru"]
  spec.description   = %q{Gem for fetching date or datetime from rails view helpers}
  spec.summary       = %q{Gem provides functionality for fetching date/datetime from
                          rails view helpers such as date_select, datetime_select,
                          select_date and select_datetime}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'activesupport'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
