# frozen_string_literal: true

require_relative '../../test_helper'

module Yarh
  class RequestBuilderTest < Minitest::Test
    def setup
      @url = 'https://example.com/api/v1/users'
    end

    def test_with_stub_request_get_first
      data = {
        url: @url,
        method: 'get'
      }

      request = RequestBuilder.new(data)

      stub_request(:get, @url)

      request.request
    end

    def test_with_stub_request_get_second
      data = {
        url: @url,
        method: 'get',
        params: {
          kek: 'lol'
        }
      }

      request = RequestBuilder.new(data)

      stub_request(:get, "#{@url}?kek=lol")

      request.request
    end

    def test_with_stub_request_post_first # rubocop:disable Metrics/MethodLength
      data = {
        url: @url,
        method: 'PoSt',
        headers: {
          'Content-Type' => 'application/json',
          some_header: 'header_value'
        }
      }

      request = RequestBuilder.new(data)

      stub_request(:post, @url).with(headers: { 'Content-Type' => 'application/json',
                                                'some_header' => 'header_value' })

      request.request
    end

    def test_with_stub_request_post_second # rubocop:disable Metrics/MethodLength
      data = {
        url: @url,
        method: 'PoSt',
        headers: {
          'Content-Type' => 'application/json',
          some_header: 'header_value'
        },
        body: {
          key1: 'value1',
          key2: 'value2'
        }
      }

      request = RequestBuilder.new(data)

      stub_request(:post, @url).with(body: { key1: 'value1',
                                             key2: 'value2' }.to_json, headers: { 'Content-Type' => 'application/json',
                                                                                  'some_header' => 'header_value' })

      request.request
    end

    def test_with_stub_request_post_third # rubocop:disable Metrics/MethodLength
      data = {
        url: @url,
        method: 'PoSt',
        body: {
          key1: 'value1',
          key2: 'value2'
        }
      }

      request = RequestBuilder.new(data)

      stub_request(:post, @url).with(body: { key1: 'value1',
                                             key2: 'value2' })

      request.request
    end

    def test_when_no_request_method # rubocop:disable Metrics/MethodLength
      data = {
        url: @url,
        body: {
          key1: 'value1',
          key2: 'value2'
        }
      }

      request = RequestBuilder.new(data)

      assert_raises(Errors::WrongDataError) do
        request.request
      end
    end

    def test_when_no_request_url # rubocop:disable Metrics/MethodLength
      data = {
        method: 'POST',
        body: {
          key1: 'value1',
          key2: 'value2'
        }
      }

      request = RequestBuilder.new(data)

      assert_raises(Errors::WrongDataError) do
        request.request
      end
    end
  end
end
