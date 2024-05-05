# frozen_string_literal: true

require 'yaml'

module Yarh
  # The main parser of Yaml files, uses psych under the hood
  class YamlParser
    def self.parse(file_path)
      YAML.safe_load_file(file_path)
    end
  end
end
