class UserDietLogsController < ApplicationController
    before_action :set_user_diet_log, only: [:show, :update, :destroy]
    def index
        render json: {
            status: 200,
            data: current_user.user_diet_logs.order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @user_diet_log
        }
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
