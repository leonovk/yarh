# frozen_string_literal: true

require_relative 'lib/yarh/version'

Gem::Specification.new do |s|
  s.name         = 'yarh'
  s.version      = Yarh::VERSION
  s.summary      = 'Yet Another Request Handler'
  s.description  = 'Create specifications for HTTP requests without a single line of code'
  s.authors      = ['Kirill Leonov']
  s.email        = 'leonov7632@gmail.com'
  s.files        = Dir['exe/**/*', 'lib/**/{*,.[a-z]*}']
  s.require_path = 'lib'
  s.bindir       = 'exe'
  s.executables = ['yarh']
  s.homepage     = 'https://github.com/leonovk/yarh'
  s.license      = 'MIT'
  s.required_ruby_version = '>= 3.0'
  s.metadata['homepage_uri'] = s.homepage
  s.metadata['source_code_uri'] = s.homepage
  s.metadata['documentation_uri'] = s.homepage
  s.add_dependency 'faraday', '~> 2.9'
  s.add_dependency 'faraday-multipart', '~> 1.0', '>= 1.0.4'
  s.add_dependency 'thor', '~> 1.3'
end
