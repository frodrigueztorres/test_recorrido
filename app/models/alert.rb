class Alert < ApplicationRecord
  enum bus_class: { premium: 1, bed_room: 2, semi_room: 3, pullman: 4, other: 5 }

  private
  # def fetch_id :city_name
  #   Recorrido::Api.get_cities[:cities].select { |k,v| k[:name] == :city_name }[0][:id]
  # end
end
