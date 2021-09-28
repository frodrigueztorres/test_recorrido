require 'uri'
require 'net/http'
require 'openssl'
require 'uri/query_params'

module Recorrido
  class Api
    ENDPOINT = 'https://demo.recorrido.cl/api/v2'
    # API_USERNAME = ENV.fetch("API_USERNAME")
    # API_PASSWORD = ENV.fetch("API_PASSWORD")

    def self.get_cities
      url = URI("#{ENDPOINT}/es/cities.json?country=chile")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(URI(url.to_s))
      request["Accept"] = "application/json"
      request["Content-Type"] = "application/json"
      request.basic_auth("recorrido", "recorrido")

      response = http.request(request)
      JSON.parse(response.read_body).with_indifferent_access
    end
  end
end
