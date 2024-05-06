# frozen_string_literal: true

require_relative 'base_error'

module Yarh
  module Errors
    # wrong data error
    class WrongDataError < BaseError
      def message
        'Incorrect request data sent'
      end
    end
  end
end
