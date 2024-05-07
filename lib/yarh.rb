# frozen_string_literal: true

require_relative 'yarh/request_runner'

# main module
module Yarh
  def self.run_requests(path)
    RequestRunner.new(path).run
  end
end
