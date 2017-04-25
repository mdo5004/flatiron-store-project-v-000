class CartsController < ApplicationController
    before_action :signed_in?
    def checkout
<<<<<<< HEAD
        @cart = Cart.find(params[:id])
        @cart.checkout
        
=======
        
#        raise current_user.inspect
        @cart = current_user.current_cart
        if @cart.nil? 
            @cart = current_user.carts.last
        end

        @cart.line_items.each do |li|
            item = Item.find(li.item_id)
            item.update(inventory: item.inventory - li.quantity) 
        end
        @cart.submit
        current_user.cart = nil

        puts "Current Cart = #{current_user.current_cart}"
        current_user.reload

>>>>>>> 8a166f44a8050c0e0afb27a7f297f3ed815b1167
        redirect_to cart_path(@cart)

    end
    def show
#        binding.pry
        @cart = Cart.find(params[:id])
#        binding.pry
    end
<<<<<<< HEAD
    
    
=======

    private
    def signed_in?
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end
>>>>>>> 8a166f44a8050c0e0afb27a7f297f3ed815b1167
end
