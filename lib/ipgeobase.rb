# frozen_string_literal: true

require_relative "ipgeobase/version"
require "httparty"
require "happymapper"
# main module for ipgeobase gem
module Ipgeobase
  include HTTParty
  include HappyMapper
  IP_API_ADDRESS = "http://ip-api.com"
  RESPONSE_FORMAT = "json"
  class Error < StandardError; end

  def lookup(ip_address)
    HTTParty.get("#{IP_API_ADDRESS}/#{RESPONSE_FORMAT}/#{ip_address}").to_hash
  end
end
