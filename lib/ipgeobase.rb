# frozen_string_literal: true

require_relative "ipgeobase/version"
require "httparty"
require "happymapper"
# main module for ipgeobase gem
module Ipgeobase
  include HTTParty
  include HappyMapper
  IP_IP_ADDRESS = "http://ip-api.com"
  RESPONSE_FORMAT = "xml"
  RESPONSE_QUERY_KEY = "query"
  class Error < StandardError; end

  def lookup(ip_address)
    HTTParty.get("#{IP_IP_ADDRESS}/#{RESPONSE_FORMAT}/#{ip_address}")[RESPONSE_QUERY_KEY]
  end
end
