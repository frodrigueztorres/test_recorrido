class Alert < ApplicationRecord
  enum class: { premium: 1, bed_room: 2, semi_room: 3, pullman: 4, other: 5 }
end
