# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ver_ex/version'

Gem::Specification.new do |gem|
  gem.name          = 'ver_ex'
  gem.version       = VerEx::VERSION
  gem.platform      = Gem::Platform::RUBY
  gem.authors       = ['Mark IJbema']
  gem.email         = ['markijbema@gmail.com']
  gem.summary       = %q{Ruby implementation of Verbal Expressions}
  gem.description   = %q{}
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/markijbema/ver_ex'
  gem.files         = `git ls-files lib`.split($/)
  gem.test_files    = gem.files.grep(%r{^(spec)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'rake'
end
