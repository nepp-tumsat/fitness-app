class EatenUserFoodWeight < ApplicationRecord
    belongs_to :user_diet_log
    belongs_to :user_created_food
end
