class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    has_many :carts
#    attr_accessor :current_cart
    def current_cart=(cart)
        if cart.is_a? Cart 
            self.current_cart_id = cart.id
        elsif !!cart
            self.current_cart_id = cart
        else
            self.current_cart_id = nil
        end
    
        self.save
    end
    def current_cart
        
        Cart.find_by(id: self.current_cart_id)
    end
end
