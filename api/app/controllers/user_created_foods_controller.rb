class UserCreatedFoodsController < ApplicationController
    before_action :set_user_created_food, only: [:show, :update, :destroy]
    def index
        render json: {
            status: 200,
            data: UserCreatedFood.where(user_id: current_user.id).order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @user_created_food
        }
    end

    def add_food
        user_diet_logs = current_user.user_diet_logs
        user_diet_logs.user_created_foods << @user_created_food
        render json: {
            status: 200,
            data: user_diet_logs.user_created_foods
        }
    end

    def create
        user_created_food = UserCreatedFood.new(user_created_food_params)
        if user_created_food.save
            render json: {
                status: 200,
                data: user_created_food
            }
        else
            render json: {
                status: 500,
                data: user_created_food.errors
            }
        end
    end

    def destroy
        @user_created_food.destroy
        render json:{
            status: 200,
            message: "Deleted the user_created_food",
            data: @user_created_food
        }
    end

    def update
        if @user_created_food.update(training_content_params)
            render json:{
                status: 200,
                message: "Updated the user_created_food",
                data: @user_created_food
        }
        else
            render json:{
                status: 200,
                message: "Nothing to update",
                data: @user_created_food.errors
        }
        end
    end
    private
    def set_user_created_food
        @user_created_food =UserCreatedFood.find(params[:id])
    end

    def user_created_food_params
        params.require(:user_created_food).permit(:user_id,:name,:protein,:fat,:carbohydrates,:energy)
    end
end
