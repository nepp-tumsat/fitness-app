class TargetsController < ApplicationController
    before_action :set_target, only: [:show, :update, :destroy]
    def index
        render json: {
            status: 200,
            data: current_user.targets.order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @target
        }
    end

    def create
        target = Target.new(target_params)
        if target.save
            render json: {
                status: 200,
                data: target
            }
        else
            render json: {
                status: 500,
                data: target.errors
            }
        end
    end

    def destroy
        @target.destroy
        render json:{
            status: 200,
            message: "Deleted the target",
            data: @target
        }
    end

    def update
        if @target.update(target_params)
            render json:{
                status: 200,
                message: "Updated the target",
                data: @target
        }
        else
            render json:{
                status: 200,
                message: "Nothing to update",
                data: @target.errors
        }
        end
    end
    private
    def set_target
        @target = Target.find(params[:id])
    end

    def target_params
        params.require(:target).permit(:user_id,:weight,:body_fat_rate,:daily_energy,:weight_limit,:body_fat_rate_limit)
    end
end
