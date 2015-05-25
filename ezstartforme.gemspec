# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ezstartforme/version'

Gem::Specification.new do |spec|
  spec.name          = "ezstartforme"
  spec.version       = Ezstartforme::VERSION
  spec.authors       = ["lutusu"]
  spec.email         = ["tripplewheels@gmail.com"]

  spec.summary       = %q{This gem setups a project template for me personally }
  spec.license       = "MIT"

  spec.files         = Dir.glob("{lib}/**/*") + %w(LICENSE.txt README.md CHANGELOG.md)
  spec.test_files    = Dir.glob("{spec,test,features}/**/*")
  spec.bindir        = "bin"
  spec.executables   = Dir.glob("{bin}/**/*")
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.0'

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
