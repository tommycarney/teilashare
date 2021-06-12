# frozen_string_literal: true

require_relative 'lib/shareasale/version'

Gem::Specification.new do |spec|
  spec.name          = 'shareasale'
  spec.version       = Shareasale::VERSION
  spec.authors       = ['Thomas Carney']
  spec.email         = ['thomas@thomascarney.org']

  spec.summary       = 'Unofficial Ruby wrapper for the ShareASale Affiliate API'
  spec.description   = 'This provides a Ruby wrapper around the ShareASale affiliate-related endpoints'
  spec.homepage      = 'https://thomascarney.org'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'activesupport'
  spec.add_dependency 'faraday', '~> 1.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-rspec'
  spec.add_development_dependency 'vcr', '~> 5.1'
  spec.add_development_dependency 'webmock', '~> 3.8'
end
