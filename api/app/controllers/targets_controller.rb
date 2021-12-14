class TargetsController < ApplicationController
    before_action :set_target, only: [:show, :edit, :update, :destroy]
    def index
        render json: {
        status: 200,
        targets: current_user.targets.order(created_at: :desc)

    }
    end
    private
    def set_target
        @target = Target.find(params[:id])
    end
end
