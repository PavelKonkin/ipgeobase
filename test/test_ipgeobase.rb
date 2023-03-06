# frozen_string_literal: true

require "test_helper"
# class for testing ipgeobase gem
class TestIpgeobase < Minitest::Test
  include Ipgeobase

  def initialize(state)
    @ip_address = "8.8.8.8"
    @empty_address = ""
    super
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_ip_metadata_received
    response = lookup(@ip_address)
    assert (response.is_a? Hash) && response.any?
  end

  def test_metadata_has_properties
    response = lookup(@ip_address)
    assert response.key? "city"
    assert response.key? "country"
    assert response.key? "countryCode"
    assert response.key? "lat"
    assert response.key? "lon"
  end

  def test_metadata_values_are_correct
    response = lookup(@ip_address)
    assert response["city"] == "Ashburn"
    assert response["country"] == "United States"
    assert response["countryCode"] == "US"
    assert response["lat"] == "39.03"
    assert response["lon"] == "-77.5"
  end
end
