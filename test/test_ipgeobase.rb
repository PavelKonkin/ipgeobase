# frozen_string_literal: true

require "test_helper"
# class for testing ipgeobase gem
class TestIpgeobase < Minitest::Test
  include Ipgeobase

  def initialize(state)
    @ip_address = "8.8.8.8"
    @webmock_address = "http://ip-api.com/json/8.8.8.8"
    @webmock_headers_with = { "Accept" => "*/*", "Accept-Encoding" => "gzip;q=1.0,deflate;q=0.6,identity;q=0.3",
                              "User-Agent" => "Ruby" }
    @webmock_body = "{ \"city\": \"Ashburn\",
                       \"country\": \"United States\",
                       \"countryCode\": \"US\",
                       \"lat\": \"39.03\",
                       \"lon\": \"-77.5\" }"
    super
  end

  def test_that_it_has_a_version_number
    refute_nil ::Ipgeobase::VERSION
  end

  def test_ip_metadata_received
    webmock_request
    response = lookup(@ip_address)
    assert (response.is_a? Hash) && response.any?
  end

  def test_ip_metadata_has_properties
    webmock_request
    response = lookup(@ip_address)
    assert response.key? "city"
    assert response.key? "country"
    assert response.key? "countryCode"
    assert response.key? "lat"
    assert response.key? "lon"
  end

  def test_ip_metadata_values_are_correct
    webmock_request
    response = lookup(@ip_address)
    assert response["city"] == "Ashburn"
    assert response["country"] == "United States"
    assert response["countryCode"] == "US"
    assert response["lat"] == "39.03"
    assert response["lon"] == "-77.5"
  end

  private

  def webmock_request
    stub_request(:get, @webmock_address)
      .with(headers: @webmock_headers_with)
      .to_return body: @webmock_body,
                 headers: { content_type: "application/json" }
  end
end
