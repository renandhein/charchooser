class CharacterTrait < ApplicationRecord
  belongs_to :character
  belongs_to :trait

  validates :value, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100}
end
