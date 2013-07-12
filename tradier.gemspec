# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tradier/version'

Gem::Specification.new do |gem|
  gem.name        = 'tradier'
  gem.version     = Tradier::VERSION
  gem.homepage    = 'https://github.com/tradier/tradier.rb'

  gem.author      = ["Steve Agalloco", "Jason Barry"]
  gem.email       = ['steve.agalloco@gmail.com', 'jay@jcbarry.com']
  gem.description = "Rubygem for interacting with the Tradier API."
  gem.summary     = gem.description

  gem.add_dependency 'faraday', ['~> 0.8', '< 0.10']
  gem.add_dependency 'faraday_middleware', ['~> 0.8', '< 0.10']
  gem.add_dependency 'celluloid'
  gem.add_development_dependency 'bundler', '~> 1.0'

  gem.files = %w(.yardopts LICENSE.md README.md Rakefile tradier.gemspec)
  gem.files += Dir.glob("lib/**/*.rb")
  gem.files += Dir.glob("spec/**/*")

  gem.test_files = Dir.glob("spec/**/*")

  gem.require_paths = ['lib']
end
