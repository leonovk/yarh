# frozen_string_literal: true

require 'yaml'
require_relative 'request_builder'

module Yarh
  # Main class for running queries from a file
  class RequestRunner
    attr_accessor :parsed_yaml

    def initialize(path)
      @parsed_yaml = YAML.safe_load_file(path)
    end

    def run
      parsed_yaml.each_value do |data|
        RequestBuilder.new(data).request
      end
    end
  end
end
