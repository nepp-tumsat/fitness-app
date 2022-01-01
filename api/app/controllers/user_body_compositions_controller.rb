class UserBodyCompositionsController < ApplicationController
    before_action :set_user_body_compositions, only: [:show, :update, :destroy]
    def index
        render json: {
            status: 200,
            data: current_user.user_body_compositions.order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @user_body_composition
        }
    end

    def create
        user_body_composition = UserBodyComposition.new(user_body_composition_params)
        if user_body_composition.save
            render json: {
                status: 200,
                data: user_body_composition
            }
        else
            render json: {
                status: 500,
                data: user_body_composition.errors
            }
        end
    end

    def destroy
        @user_body_composition.destroy
        render json:{
            status: 200,
            message: "Deleted the user_body_composition",
            data: @user_body_composition
        }
    end

    def update
        if @user_body_composition.update(user_body_composition_params)
            render json:{
                status: 200,
                message: "Updated the user_body_composition",
                data: @user_body_composition
        }
        else
            render json:{
                status: 200,
                message: "Nothing to update",
                data: @user_body_composition.errors
        }
        end
    end
    private
    def set_user_body_compositions
        @user_body_composition = UserBodyComposition.find(params[:id])
    end

    def user_body_composition_params
        params.require(:user_body_composition).permit(:user_id,:weight,:body_fat_rate)
    end
end