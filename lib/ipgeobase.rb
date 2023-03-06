# frozen_string_literal: true

require_relative "ipgeobase/version"

module Ipgeobase
  class Error < StandardError; end

  def ip_metadata(ip_address)
    ip_address.to_s
  end
end
