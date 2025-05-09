require "faraday"

module Essence
  class Client
    attr_reader :client

    def initialize(**attributes)
      @client = ::Faraday.new(url: "https://essenceui.com/") do |f|
        f.request :authorization, "Bearer", -> { ::Essence.configuration.licence_key }
        f.request :json
        f.response :json
      end
    end

    def get_component(slug: nil)
      return if nil
      client.get("api/v1/components/#{slug}").body
    rescue Faraday::Error => error
      puts error
    end
  end
end
