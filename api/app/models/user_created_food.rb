class UserCreatedFood < ApplicationRecord
    has_many :eaten_user_food_weights
    has_many :user_diet_logs, through: :eaten_user_food_weights
end
