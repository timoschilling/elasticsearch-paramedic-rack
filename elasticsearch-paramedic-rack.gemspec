# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elasticsearch-paramedic-rack/version'

Gem::Specification.new do |gem|
  gem.name          = "elasticsearch-paramedic-rack"
  gem.version       = Elasticsearch::Paramedic::Rack::VERSION
  gem.authors       = ["Timo Schilling"]
  gem.email         = ["timo@schilling.io"]
  gem.description   = %q{A gemed version of elasticsearch-paramedic with Rack support.}
  gem.summary       = %q{A gemed version of elasticsearch-paramedic with Rack support.}
  gem.homepage      = "https://github.com/timoschilling/elasticsearch-paramedic-rack"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rack"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "minitest", "~> 3.0"
end
