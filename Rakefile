# frozen_string_literal: true

require_relative 'lib/yarh/version'
require 'rake/testtask'

# run rake test MINITEST_REPORTER=HtmlReporter
# for generate html reports
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/*_test.rb']
end

task :build_and_push do
  puts "build yarh #{Yarh::VERSION}"
  system 'gem build yarh.gemspec'
  file_name = "yarh-#{Yarh::VERSION}.gem"
  system "gem push #{file_name} -k rubygems"
  File.delete(file_name)
  puts 'done'
end

task full_check: :test do
  system 'rubocop'
end

task default: :full_check
