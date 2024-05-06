# frozen_string_literal: true

require_relative '../../test_helper'

module Yarh
  class RequestBodyTest < Minitest::Test
    def test_when_simple_body
      body = {
        key1: 'value1',
        key2: 'value2'
      }

      result = RequestBody.new(body).create

      assert_equal body, result
    end

    def test_when_body_include_hash # rubocop:disable Metrics/MethodLength
      body = {
        key1: 'value1',
        key2: 'value2',
        key3: {
          'path' => 'path',
          'file_type' => 'type'
        }
      }

      expected_body = {
        key1: 'value1',
        key2: 'value2',
        key3: 123
      }
      Faraday::UploadIO.expects(:new).with('path', 'type').returns(123)
      result = RequestBody.new(body).create

      assert_equal expected_body, result
    end

    def test_when_no_path
      body = {
        key1: 'value1',
        key2: 'value2',
        key3: {
          'file_type' => 'type'
        }
      }

      result = RequestBody.new(body).create

      assert_equal body, result
    end

    def test_when_no_file_type
      body = {
        key1: 'value1',
        key2: 'value2',
        key3: {
          'path' => 'path'
        }
      }

      result = RequestBody.new(body).create

      assert_equal body, result
    end
  end
end
