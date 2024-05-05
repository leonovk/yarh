# frozen_string_literal: true

require_relative 'lib/yarh/version'

task :build_and_push do
  puts "build yarh #{Yarh::VERSION}"
  system 'gem build yarh.gemspec'
  file_name = "yarh-#{Yarh::VERSION}.gem"
  system "gem push #{file_name} -k rubygems"
  File.delete(file_name)
  puts 'done'
end
