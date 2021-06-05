# frozen_string_literal: true

require_relative 'lib/active_translate_self/version'

Gem::Specification.new do |spec|
  spec.name        = 'active_translate_self'
  spec.version     = ActiveTranslateSelf::VERSION
  spec.authors     = ['Sampo Kuokkanen']
  spec.email       = ['sampo.kuokkanen@gmail.com']
  spec.homepage    = 'https://github.com/sampokuokkanen/ActiveTranslateSelf'
  spec.summary     = 'ActiveTranslateSelf provides the strings in Rails an ability to translate themselves.'
  spec.description = 'ActiveTranslateSelf is a Rails engine that hacks the Ruby string class and lets them translate \
                      themselves. Supports English, Finnish, Japanese, and others!'
  spec.license     = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"
  spec.required_ruby_version = '>= 2.5.0'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '>= 5.2'
  spec.add_dependency 'translate_self', '~> 0.3.0'
  spec.add_development_dependency 'byebug'
end
