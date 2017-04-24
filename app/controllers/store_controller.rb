class StoreController < ApplicationController
    def index 
        @categories = Category.all
        @items = Item.where("inventory > ?", 0)
        @cart = current_cart
    end
end
