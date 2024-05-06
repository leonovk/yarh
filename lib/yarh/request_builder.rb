# frozen_string_literal: true

require 'faraday'
require 'json'

module Yarh
  # RequestBuilder
  class RequestBuilder
    attr_reader :response

    def initialize(data)
      @data = data
      @response = nil
    end

    def request
      conn = Faraday.new(url: data['url'])

      response = conn.send(data['method'].downcase.to_sym) do |req|
        build_headers(req, data['headers'])
        req.body = data['body'].to_json
      end

      @response = response
    end

    private

    attr_reader :data

    def build_headers(req, headers)
      headers.each do |header, value|
        req.headers[header] = value
      end
    end
  end
end
