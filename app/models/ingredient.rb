class Ingredient < ActiveRecord::Base
  has_many :cocktail
end
