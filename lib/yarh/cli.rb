# frozen_string_literal: true

require 'thor'
require_relative 'version'
require_relative '../yarh'

module Yarh
  # CLI
  class CLI < Thor
    package_name 'Yarh'
    map '-v' => :version
    map '-r' => :run_requests

    desc '-r PATH', 'execute requests from file'
    def run_requests(path)
      puts Yarh.run_requests(path)
    end

    desc 'version', 'show Yarh version'
    def version
      puts "Yarh #{Yarh::VERSION}"
    end
  end
end
