class TrainingsController < ApplicationController
    before_action :set_training, only: [:show, :update, :destroy]
    def index
        render json: {
            status: 200,
            data: current_user.trainings.order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @training
        }
    end

    def create
        training = Training.new(training_params)
        if training.save
            render json: {
                status: 200,
                data: training
            }
        else
            render json: {
                status: 500,
                data: training.errors
            }
        end
    end

    def destroy
        @training.destroy
        render json:{
            status: 200,
            message: "Deleted the training",
            data: @training
        }
    end

    def update
        if @training.update(training_params)
            render json:{
                status: 200,
                message: "Updated the training",
                data: @training
        }
        else
            render json:{
                status: 200,
                message: "Nothing to update",
                data: @training.errors
        }
        end
    end
    private
    def set_training
        @training = Training.find(params[:id])
    end

    def training_params
        params.require(:training).permit(:user_id,:training_content_id,:rep,:weight,:done_at)
    end
end