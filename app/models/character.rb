class Character < ApplicationRecord
  has_many :character_traits
  has_many :traits, :through => :character_traits
end
