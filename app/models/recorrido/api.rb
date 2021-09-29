require 'uri'
require 'net/http'
require 'openssl'
require 'uri/query_params'

module Recorrido
  class Api
    ENDPOINT = 'https://demo.recorrido.cl/api/v2'
    API_USERNAME = Rails.application.credentials.recorrido[:api_username]
    API_PASSWORD = Rails.application.credentials.recorrido[:api_password]

    def self.get_cities
      url = URI("#{ENDPOINT}/es/cities.json?country=chile")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(URI(url.to_s))
      request["Accept"] = "application/json"
      request["Content-Type"] = "application/json"
      request.basic_auth(API_USERNAME, API_PASSWORD)

      response = http.request(request)
      JSON.parse(response.read_body).with_indifferent_access
    end

    def self.bus_travel alert:, date:
      url = URI("#{ENDPOINT}/es/bus_travels.json")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(URI(url.to_s))
      request["Accept"] = "application/json"
      request["Content-Type"] = "application/json"
      request.basic_auth(API_USERNAME, API_PASSWORD)

      request.body = {
        bus_travel: {
          departure_city_id: alert.city_origin_id,
          destination_city_id: alert.city_destination_id,
          departure_date: I18n.l(date.to_date)
          # departure_date: I18n.l(alert.updated_at.to_date)
        }
      }.to_json

      response = http.request(request)
      JSON.parse(response.read_body).with_indifferent_access
    end

    def self.search_results search_id:
      url = URI("#{ENDPOINT}/es/bus_travels/#{search_id}/search_results.json")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(URI(url.to_s))
      request["Accept"] = "application/json"
      request["Content-Type"] = "application/json"
      request.basic_auth(API_USERNAME, API_PASSWORD)

      response = http.request(request)
      JSON.parse(response.read_body).with_indifferent_access
    end
  end
end
