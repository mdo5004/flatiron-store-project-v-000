require 'pry'
class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user

    def total
        item_total = 0
        items.each do |item|
            item_total += item.price
        end
        item_total
    end
    def add_item(item_id)
        if Item.find_by(id:item_id)
            li = line_items.where(:cart_id => id, :item_id => item_id).first_or_initialize
            if li.persisted?
                li.update(quantity: li.quantity+1)
            end

            li
        end
    end
end
