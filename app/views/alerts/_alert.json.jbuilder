json.extract! alert, :id, :name, :city_origin, :city_destination, :bus_class, :price, :created_at, :updated_at
json.url alert_url(alert, format: :json)
