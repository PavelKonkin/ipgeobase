# frozen_string_literal: true

require "test_helper"
# class for testing ipgeobase gem
class TestIpgeobase < Minitest::Test
  include Ipgeobase
  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_ip_metadata_received
    refute ip_metadata("8.8.8.8").nil?
  end

  def test_it_does_something_useful
    assert true
  end
end
