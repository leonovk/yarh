# frozen_string_literal: true

require_relative '../../test_helper'

module Yarh
  class YamlParserTest < Minitest::Test
    def test_parse
      expect_hash = { 'start' => { 'kek' => { 'lol' => 'text', 'cheburek' => 'cheburek',
                                              'users' => %w[Kirill Ekaterina] } } }

      result = YamlParser.parse('test/examples/test.yaml')

      assert_equal result, expect_hash
    end
  end
end
