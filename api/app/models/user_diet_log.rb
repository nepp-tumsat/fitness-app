class UserDietLog < ApplicationRecord
    belongs_to :user
    has_many :eaten_scraped_food_weights
    has_many :eaten_user_food_weights
    has_many :scraped_foods, through: :eaten_scraped_food_weights
    has_many :user_created_foods, through: :eaten_user_food_weights
end
