class LineItemsController < ApplicationController
    def create        
        cart = current_cart
        if cart.submitted?
            cart = Cart.create
            current_user.current_cart = cart
        end
        item_added = cart.add_item(params[:item_id])
        if item_added.save
            redirect_to cart
        else
            notice = "Item not added to cart"
            redirect_to request.referrer || root_path 
        end
    end
end
