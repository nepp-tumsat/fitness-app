class ScrapedFood < ApplicationRecord
    has_many :eaten_scraped_food_weights
    has_many :user_diet_logs, through: :eaten_scraped_food_weights
end
