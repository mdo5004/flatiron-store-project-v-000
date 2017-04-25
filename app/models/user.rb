class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    has_many :carts
    attr_accessor :current_cart
    
#    def current_cart=(cart)
#        if cart.is_a? Cart 
#            @cart = cart
#        else
#            @cart = nil
#        end
#    end
#    def current_cart  
#        @cart
#    end
end
