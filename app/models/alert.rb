class Alert < ApplicationRecord
  enum bus_class: { premium: 1, bed_room: 2, semi_room: 3, pullman: 4, other: 5 }

  def fetch_id_origin
    Recorrido::Api.get_cities[:cities].select { |k,v| k[:name] == self.city_origin }[0][:id]
  end

  def fetch_id_destination
    Recorrido::Api.get_cities[:cities].select { |k,v| k[:name] == self.city_destination }[0][:id]
  end
end
