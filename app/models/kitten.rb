class Kitten < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { greater_than_or_equal_to: 1 }
  validates :cuteness, numericality: { greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10 }
  validates :softness, numericality: { greater_than_or_equal_to: 1,
    less_than_or_equal_to: 10 }

  # def softness_cuteness_overload
  #   if softness > 10
  #     errors.add(:softness, "Kitty is too soft!!")
  #   end
  #   if cuteness > 10
  #     errors.add(:cuteness, "Kitty is too cute!!")
  #   end
  # end

  # def softness_cuteness_underload
  #   if softness < 0
  #     errors.add(:softness, "Kitty cannot be rock-like.")
  #   end
  #   if cuteness < 0
  #     errors.add(:cuteness, "IMPOSSIBLE!!!")
  #   end
  # end
end
