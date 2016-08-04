class Ingredient < ActiveRecord::Base
  has_many :doses
  has_many :cocktails, through: :doses
  before_destroy :check_for_cocktails

  validates :name, presence: true, uniqueness: true

  private

  def check_for_cocktails
    if cocktails.count > 0
      errors.add_to_base("cannot delete ingredients while cocktails exist")
      return false
    end
  end
end
