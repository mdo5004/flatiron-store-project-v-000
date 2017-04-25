class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user

    def total
        item_total = 0
        line_items.each do |line_item|
            item_total += (line_item.item.price * line_item.quantity.to_f)
        end
        item_total
    end
    def add_item(item_id)
        if submitted?
            return false
        end
        if Item.find_by(id:item_id)
            li = line_items.where(:cart_id => id, :item_id => item_id).first_or_initialize
            if li.persisted?
                li.update(quantity: li.quantity+1)
            end
            return li
        end
    end
    
    def checkout
        line_items.each do |li|
            item = Item.find(li.item_id)
            item.update(inventory: item.inventory - li.quantity) 
        end
        self.submit
        
        user.update(current_cart:nil)
        
    end
    
    def submit
        self.update(status:"submitted")
        Order.create(cart_id: self.id)        
    end
    def submitted?
        status == "submitted" 
    end
end
