class LineItemsController < ApplicationController
<<<<<<< HEAD
    def create        
        cart = current_cart
        if cart.nil? || cart.submitted?
=======
    def create  
#        raise current_user.inspect
        if current_user.current_cart.nil? || current_user.current_cart.submitted?

>>>>>>> 8a166f44a8050c0e0afb27a7f297f3ed815b1167
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
