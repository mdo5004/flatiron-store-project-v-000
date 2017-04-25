class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

    has_many :carts

    def current_cart=(cart)
        if cart.is_a? Cart 
            @cart = cart
        elsif cart
            @cart = Cart.find_by(id: cart)
        else
            @cart = nil
        end
    end
    def current_cart
        @cart
    end
end
