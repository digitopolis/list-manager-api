class Api::V1::ListsController < ApplicationController
    before_action :find_list, only: [:show]
    
    def show
        render json: @list, status: :ok
    end

    def new
        @list = List.new
    end

    def create
        @list = List.create(list_params)
        if @list.valid?
            @user = User.find(@list.user_id)
            render json: { list: ListSerializer.new(@list), user: UserSerializer.new(@user) }, status: :accepted
        else 
            render json: { error: 'List not created' }, status: :not_acceptable
        end
    end

    private

    def list_params
        params.permit(:title, :description, :user_id)
    end

    def find_list
        @list = List.find(params[:id])
    end
end
