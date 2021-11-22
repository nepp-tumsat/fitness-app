class UserCreatedFood < ApplicationRecord
    has_many :eaten_user_food_weights
end
