# frozen_string_literal: true

require 'minitest/autorun'
require 'byebug'
require 'minitest/reporters'
require_relative '../lib/yarh'
require_relative '../lib/yarh/version'
require_relative '../lib/yarh/yaml_parser'

Minitest::Reporters.use!
