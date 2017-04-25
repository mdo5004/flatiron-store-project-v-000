class CartsController < ApplicationController
    before_action :signed_in?
    def checkout
        @cart = Cart.find(params[:id])
        @cart.checkout
        
        redirect_to cart_path(@cart)
    end
    def show
        @cart = Cart.find(params[:id])
    end
    
    
end
