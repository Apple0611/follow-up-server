class Disease < ActiveRecord::Base

  validates :name, length: {
    minimum: 1,
    maximum: 100,
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }
  validates :parent, numericality: { only_integer: true }
  validates :level, numericality: { only_integer: true }
  validates :is_active, inclusion: { in: [true, false], message: "%{value} is not a valid size" }
  validates :is_empty, inclusion: { in: [true, false], message: "%{value} is not a valid size" }
  validates :is_bottom, inclusion: { in: [true, false], message: "%{value} is not a valid size" }

end
