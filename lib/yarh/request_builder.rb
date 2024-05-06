# frozen_string_literal: true

require 'faraday'
require 'json'
require_relative 'errors/wrong_data_error'

module Yarh
  # Сlass builds a request from hash parameters and executes the request
  class RequestBuilder
    attr_reader :response

    def initialize(data)
      @data = data.stringify_keys
      @response = nil
    end

    def request
      raise Errors::WrongDataError if method.nil? || url.nil?

      conn = Faraday.new(url: url)

      @response = send_request(conn)
    end

    private

    attr_reader :data

    def send_request(faraday_connection)
      faraday_connection.send(method) do |req|
        build_headers(req, data['headers'])
        req.body = body if body
        req.params = params if params
        req.options.timeout timeout if timeout
      end
    end

    def method
      return unless data['method']

      data['method'].downcase.to_sym
    end

    def url
      data['url']
    end

    def params
      data['params']
    end

    def timeout
      data['timeout']
    end

    # TODO: optimize this method in the future
    def body
      return unless data['body']

      if application_json?
        data['body'].to_json
      else
        data['body']
      end
    end

    def application_json?
      return false unless data['headers']
      return false unless data['headers']['Content-Type']

      data['headers']['Content-Type'] == 'application/json'
    end

    def build_headers(req, headers)
      return unless headers

      headers.each do |header, value|
        req.headers[header] = value
      end
    end
  end
end
