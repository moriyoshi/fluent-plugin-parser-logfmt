$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-parser-logfmt"
  spec.version       = File.read("VERSION").strip
  spec.author        = 'Moriyoshi Koizumi <mozo@mozo.jp>'
  spec.summary       = "Fluentd parser plugin that parses logfmt-style log entries"
  spec.homepage      = "https://github.com/moriyoshi/fluent-plugin-parser-logfmt"
  spec.license       = "Apache-2.0"

  spec.files         = `git ls-files`.split("\n").reject{|f| f.start_with?(".")}
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{|f| File.basename(f)}
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.1'

  spec.add_dependency "fluentd", ">= 1", "< 2"
  spec.add_dependency "logfmt", "~> 0.0.8"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit", "~> 3.0"
end
