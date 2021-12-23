class UserDietLogsController < ApplicationController
    before_action :set_user_diet_log, only: [:show, :update, :destroy]
    def index
        user_diet_logs = current_user.user_diet_logs
        render json: {
            status: 200,
            data: user_diet_logs.scraped_foods.order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @user_diet_log
        }
    end

    def add_gram
        user_diet_log = current_user.user_diet_logs.last
        #EatenScrapedFood.where(user_diet_log_id: user_diet_log.id, scraped_food_id: 1) #WIP
    end

    def create
        user_diet_log = UserDietLog.new(user_diet_log_params)
        if user_diet_log.save
            render json: {
                status: 200,
                data: user_diet_log
            }
        else
            render json: {
                status: 500,
                data: user_diet_log.errors
            }
        end
    end

    def destroy
        @user_diet_log.destroy
        render json:{
            status: 200,
            message: "Deleted the user_diet_log",
            data: @user_diet_log
        }
    end

    def update
        if @user_diet_log.update(user_diet_log_params)
            render json:{
                status: 200,
                message: "Updated the user_diet_log",
                data: @user_diet_log
        }
        else
            render json:{
                status: 200,
                message: "Nothing to update",
                data: @user_diet_log.errors
        }
        end
    end
    private
    def set_user_diet_log
        @user_diet_log = UserDietLog.find(params[:id])
    end

    def user_diet_log_params
        params.require(:user_diet_log).permit(:user_id)
    end
end
