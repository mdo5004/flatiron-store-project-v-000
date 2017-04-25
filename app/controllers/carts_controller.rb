class CartsController < ApplicationController
    before_action :signed_in?
    def checkout

        @cart = current_user.current_cart

        @cart.line_items.each do |li|
            item = Item.find(li.item_id)
            item.update(inventory: item.inventory - li.quantity) 
        end
        @cart.submit

        redirect_to cart_path(@cart)
    end
    def show
        @cart = Cart.find(params[:id])
    end
    
    private
    def signed_in?
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end
end
