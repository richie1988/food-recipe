class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :foods, dependent: :destroy
  has_many :recipe_foods, through: :recipes

  validates :name, presence: true
  validates :email, presence: true, allow_blank: false
  validates :encrypted_password, presence: true, allow_blank: false
  
  def general_shopping_list
    # Assuming you want to get the unique foods across all recipes
    food_ids = recipe_foods.joins(:food).pluck('foods.id')
    unique_food_ids = food_ids.uniq
    Food.where(id: unique_food_ids)
  end
end
