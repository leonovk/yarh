# frozen_string_literal: true

module Yarh
  # request run
  class RequestRunner
    attr_accessor :path

    def initialize(path)
      @path = path
    end

    def run
      puts "file path #{path}"
    end
  end
end
