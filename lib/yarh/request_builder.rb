# frozen_string_literal: true

require 'faraday'
require 'faraday/multipart'
require 'json'
require_relative 'errors/wrong_data_error'
require_relative 'request_body'

module Yarh
  # Сlass builds a request from hash parameters and executes the request
  class RequestBuilder
    attr_reader :response

    def initialize(data)
      @data = stringify_keys(data)
      @response = nil
    end

    def request
      validate_before_request

      @response = send_request(build_conncetion)
    end

    private

    attr_reader :data

    def validate_before_request
      raise Errors::WrongDataError if method.nil? or url.nil?
    end

    def build_conncetion
      if multipart?
        Faraday.new(url: url) do |request|
          request.request :multipart
        end
      else
        Faraday.new(url: url)
      end
    end

    def send_request(faraday_connection)
      faraday_connection.send(method) do |req|
        build_headers(req, data['headers'])
        req.body = body if body
        req.params = params if params
        req.options.timeout timeout if timeout
      end
    end

    # TODO: optimize this method in the future
    def body
      return @body unless @body.nil?
      return unless data['body']

      body = RequestBody.new(data['body']).create

      @body = if application_json?
                body.to_json
              else
                body
              end
    end

    def multipart?
      return false unless data['headers']
      return false unless data['headers']['Content-Type']

      data['headers']['Content-Type'] == 'multipart/form-data'
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

    def stringify_keys(data)
      data.is_a?(Hash) ? data.to_h { |k, v| [k.to_s, stringify_keys(v)] } : data
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
  end
end
