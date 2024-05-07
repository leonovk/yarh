# frozen_string_literal: true

require 'faraday'
require 'faraday/multipart'

module Yarh
  # Class for creating request bodies
  class RequestBody
    def initialize(body)
      @body_data = body
      @result_body = {}
    end

    def create
      body_data.each do |key, value|
        if value.is_a?(Hash)
          prepare_value(key, value)
        else
          result_body[key] = value
        end
      end

      result_body
    end

    private

    attr_reader :body_data, :result_body

    # NOTE: Currently the method is used for parsing files
    def prepare_value(key, value)
      if value['path'] and value['file_type']
        file = Faraday::UploadIO.new(value['path'], value['file_type'])
        result_body[key] = file
      else
        result_body[key] = value
      end
    end
  end
end
