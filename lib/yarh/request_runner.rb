# frozen_string_literal: true

require_relative 'yaml_parser'
require_relative 'request_builder'

module Yarh
  # request run
  class RequestRunner
    attr_accessor :path

    def initialize(path)
      @path = path
      @responses = {}
    end

    def run
      parsed_yaml.each do |request_name, data|
        request = RequestBuilder.new(data)
        request.request
        responses[request_name] = request.response
      end

      responses
    end

    private

    attr_reader :responses

    def parsed_yaml
      @parsed_yaml ||= YamlParser.parse(path)
    end
  end
end
