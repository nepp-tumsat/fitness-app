class MemosController < ApplicationController
    before_action :set_memo, only: [:show, :update, :destroy]
    def index
        render json: {
            status: 200,
            data: current_user.memos.order(created_at: :desc)
        }
    end

    def show
        render json: { 
            status: 200, 
            data: @memo
        }
    end

    def create
        memo = Memo.new(memo_params)
        if memo.save
            render json: {
                status: 200,
                data: memo
            }
        else
            render json: {
                status: 500,
                data: memo.errors
            }
        end
    end

    def destroy
        @memo.destroy
        render json:{
            status: 200,
            message: "Deleted the memo",
            data: @memo
        }
    end

    def update
        if @memo.update(memo_params)
            render json:{
                status: 200,
                message: "Updated the memo",
                data: @memo
        }
        else
            render json:{
                status: 200,
                message: "Nothing to update",
                data: @memo.errors
        }
        end
    end
    private
    def set_memo
        @memo = Memo.find(params[:id])
    end

    def memo_params
        params.require(:memo).permit(:user_id,:note,:maked_at)
    end
end