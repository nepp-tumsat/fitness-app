class UserDietLog < ApplicationRecord
    belongs_to :user
    has_many :eaten_scraped_food_weights
    has_many :eaten_user_food_weights
end
