class EatenScrapedFoodWeight < ApplicationRecord
    belongs_to :user_diet_log
    belongs_to :scraped_food
end
