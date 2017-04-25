class LineItemsController < ApplicationController
    def create  
#        raise current_user.inspect
        if current_user.current_cart.nil? || current_user.current_cart.submitted?

            cart = Cart.create(user_id: current_user.id)
            current_user.current_cart = cart
        else 
            cart = current_cart
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
