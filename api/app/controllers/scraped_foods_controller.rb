class ScrapedFoodsController < ApplicationController
    before_action :set_scraped_food, only: [:show, :update, :destroy, :add_food]
    def index
        render json: {
            status: 200,
            data: ScrapedFood.all.order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @scraped_food
        }
    end

    def add_food
        user_diet_logs = current_user.user_diet_logs
        user_diet_logs.scraped_foods << @scraped_food
        render json: {
            status: 200,
            data: user_diet_logs.scraped_foods
        }
    end

    def create
        scraped_food = ScrapedFood.new(scraped_food_params)
        if scraped_food.save
            render json: {
                status: 200,
                data: scraped_food
            }
        else
            render json: {
                status: 500,
                data: scraped_food.errors
            }
        end
    end

    def destroy
        @scraped_food.destroy
        render json:{
            status: 200,
            message: "Deleted the scraped_food",
            data: @scraped_food
        }
    end

    def update
        if @scraped_food.update(scraped_food_params)
            render json:{
                status: 200,
                message: "Updated the scraped_food",
                data: @scraped_food
        }
        else
            render json:{
                status: 200,
                message: "Nothing to update",
                data: @scraped_food.errors
        }
        end
    end
    private
    def set_scraped_food
        @scraped_food = ScrapedFood.find(params[:id])
    end

    def scraped_food_params
        params.require(:scraped_food).permit(:name,:protein,:fat,:carbohydrates,:energy)
    end
end
