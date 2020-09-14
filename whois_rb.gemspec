require_relative 'lib/whois_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "whois_rb"
  spec.version       = WhoisRb::VERSION
  spec.authors       = ["Prompt API"]
  spec.email         = ["hello@promptapi.com"]

  spec.summary       = %q{Ruby wrapper for Prompt API's Whois API}
  spec.homepage      = "https://github.com/promptapi/whois_rb"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/promptapi/whois_rb"

  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ["lib"]
  spec.add_runtime_dependency 'faraday', '~> 1.0', '>= 1.0.1'
end
