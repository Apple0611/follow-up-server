class Disease < ActiveRecord::Base

  validates :name, length: {
    minimum: 1,
    maximum: 100,
    too_short: "must have at least %{count} words",
    too_long: "must have at most %{count} words"
  }

  belongs_to :disease_category

end
