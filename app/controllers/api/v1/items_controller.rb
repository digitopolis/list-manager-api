class Api::V1::ItemsController < ApplicationController
    before_action :find_item, only: [:show, :complete]
    
    def index
        @items = Item.all
        render json: @items
    end

    def show
        render json: @item
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
        @list = List.find(params[:list_id])
        if @item.valid? && @list
            ItemsList.create(item_id: @item.id, list_id: @list.id)
            @user = User.find(@list.user.id)
            render json: { item: ItemSerializer.new(@item), user: UserSerializer.new(@user),  message: "Item created, added to #{@list.title}" }, status: :accepted
        else
            render json: { error: 'Item not created, please try again' }, status: :not_acceptable
        end
    end

    private

    def item_params
        params.permit(:title, :creator, :image_url, :medium)
    end

    def find_item
        @item = Item.find(params[:item_id])
    end
end
