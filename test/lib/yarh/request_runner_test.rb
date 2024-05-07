# frozen_string_literal: true

require_relative '../../test_helper'

module Yarh
  class RequestRunnerTest < Minitest::Test
    def setup
      @runner = RequestRunner.new('test/examples/request_2.yaml')
      stub_all_requests
    end

    def test_run
      @runner.run
    end

    private

    def stub_all_requests
      url1 = 'https://example.com/api/v1/users'
      stub_request(:post, url1).with(body: { name: 'John Doe',
                                             email: 'john.doe@example.com' }.to_json,
                                     headers: { 'Content-Type' => 'application/json' })
      url2 = 'https://example.com/api/v2/users'
      stub_request(:post, url2).with(body: { name: 'John Doe',
                                             email: 'john.doe@example.com' }.to_json,
                                     headers: { 'Content-Type' => 'application/json' })
    end
  end
end
