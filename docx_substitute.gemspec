lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "docx_substitute"
  gem.version       = "0.0.1"
  gem.authors       = ["Henry Turner"]
  gem.email         = ["themooseandthegoose@goosemail.com"]
  gem.description   = "Replace variables in a docx"
  gem.summary       = gem.description

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency "zip", "~> 2.0.0"
end