# frozen_string_literal: true

require_relative "lib/initial_config/version"

Gem::Specification.new do |spec|
  spec.name          = "initial_config"
  spec.version       = InitialConfig::VERSION
  spec.licenses      = ["MIT"]
  spec.authors       = ["Pedro Coelho"]
  spec.email         = ["pedro.coelho@sefin.ro.gov.br"]

  spec.summary       = "Write a short summary, because RubyGems requires one."
  spec.description   = "Write a longer description or delete this line."
  spec.homepage      = "https://github.com/xluminusx/initial_config"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata      = {
    "homepage_uri"      => spec.homepage,
    "source_code_uri"   => spec.homepage
    # "changelog_uri"     => "TODO: Put your gem's CHANGELOG.md URL here."
  }
  
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'bundler', '~> 2.0'
  spec.add_dependency 'tty-spinner'

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
