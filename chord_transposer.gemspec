# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chord_transposer/version'

Gem::Specification.new do |spec|
  spec.name          = "chord_transposer"
  spec.version       = ChordTransposer::VERSION
  spec.authors       = ["Nicanor Perera"]
  spec.email         = ["nicanorperera@gmail.com"]
  spec.summary       = %q{Gema para transponer acordes.}
  spec.description   = %q{Gema para transponer acordes.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
