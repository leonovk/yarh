# frozen_string_literal: true

require_relative '../test_helper'

class YarhTest < Minitest::Test
  def setup
    @path = 'test/examples/request_1.yaml'
  end

  def test_with_stub_request_first
    body = {
      name: 'John Doe',
      email: 'john.doe@example.com'
    }.to_json

    stub_request(:post, 'https://example.com/api/v1/users').with(body: body,
                                                                 headers: { 'Content-Type' => 'application/json' })

    Yarh.run_requests(@path)
  end
end
