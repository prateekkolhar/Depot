class AddPriceToLineItem < ActiveRecord::Migration
  	def up
	    add_column :line_items, :price, :decimal, precision: 8, scale: 2, default: 0
	    LineItem.all.each() do |line_item|
	  		line_item.price = Product.find(line_item.product_id).price
	  		line_item.save!
	  	end
  	end

  	def down
  		remove_column :line_items, :price, :decimal, precision: 8, scale: 2, default: 0
	end

end
