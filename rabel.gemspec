# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rabel/version'

Gem::Specification.new do |spec|
  spec.name          = "rabel"
  spec.version       = Rabel::VERSION
  spec.authors       = ["Alter Lagos"]
  spec.email         = ["alter.strife@gmail.com"]
  spec.summary       = %q{Different translations for your ruby apps.}
  spec.description   = %q{}
  spec.homepage      = "https://github.com/alagos/rabel"
  spec.license       = "MIT"

  spec.files        = Dir.glob("lib/**/*") + Dir.glob("rails/locale/*") +
                      %w(README.md LICENSE.txt)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "i18n", "~> 0.6"
  spec.add_development_dependency "nokogiri", "~> 1.5"
end
