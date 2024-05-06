# frozen_string_literal: true

require 'minitest/autorun'
require 'byebug'
require 'minitest/reporters'
require 'webmock/minitest'
require 'json'
require 'mocha/minitest'
require_relative '../lib/yarh'
require_relative '../lib/yarh/version'

Minitest::Reporters.use!
