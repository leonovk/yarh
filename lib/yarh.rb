# frozen_string_literal: true

require_relative 'yarh/request_runner'

# main module
module Yarh
  def self.run_requests(path)
    runner = RequestRunner.new(path)
    runner.run
  end
end
