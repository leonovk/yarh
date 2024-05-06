# frozen_string_literal: true

require_relative 'yaml_parser'
require_relative 'request_builder'

module Yarh
  # request run
  class RequestRunner
    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def run
      parsed_yaml.each_value do |data|
        request = RequestBuilder.new(data)
        request.request
      end
    end

    private

    def parsed_yaml
      @parsed_yaml ||= YamlParser.parse(path)
    end
  end
end
