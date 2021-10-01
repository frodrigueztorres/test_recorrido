class Alert < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  enum bus_class: { premium: 1, bed_room: 2, semi_room: 3, pullman: 4, other: 5 }

end
