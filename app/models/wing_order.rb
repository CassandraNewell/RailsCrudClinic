class WingOrder < ApplicationRecord
  QUANTITIES = [
    [10, "10 wings"],
    [25, "25 wings"],
    [50, "50 wings"],
    [100, "100 wings"],
    [120, "120 wings"]
  ]

  validates :customer_name, presence: true
  validates :city, presence: true
  validates :quantity,
    presence: true,
    numericality: { only_integer: true },
    inclusion: { in: QUANTITIES.map { |quantity| quantity[0] } }
  validates :ranch_dressing, inclusion: { in: [true, false] }
end
