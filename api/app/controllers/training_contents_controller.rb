class TrainingContentsController < ApplicationController
    before_action :set_training_content, only: [:show, :update, :destroy]
    def index
        render json: {
            status: 200,
            data: TrainingContent.where(user_id: current_user.id).order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @training_content
        }
    end

    def create
        training_content = TrainingContent.new(training_content_params)
        if training_content.save
            render json: {
                status: 200,
                data: training_content
            }
        else
            render json: {
                status: 500,
                data: training_content.errors
            }
        end
    end

    def destroy
        @training_content.destroy
        render json:{
            status: 200,
            message: "Deleted the training_content",
            data: @training_content
        }
    end

    def update
        if @training_content.update(training_content_params)
            render json:{
                status: 200,
                message: "Updated the training_content",
                data: @training_content
        }
        else
            render json:{
                status: 200,
                message: "Nothing to update",
                data: @training_content.errors
        }
        end
    end
    private
    def set_training_content
        @training_content =TrainingContent.find(params[:id])
    end

    def training_content_params
        params.require(:training_content).permit(:user_id,:name,:site,:part,:description,:unit)
    end
end
