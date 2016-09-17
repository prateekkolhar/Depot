class StoreController < ApplicationController
  def index
  	@products = Product.order(:title) 
  	#Product.all().order(:title) gives same results
  end
end
