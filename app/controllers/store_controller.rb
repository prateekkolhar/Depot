class StoreController < ApplicationController
  include StoreIndexVisitsCounter

  before_action :increment_visits_counter, only: [:index]
  def index
  	@products = Product.order(:title) 

  	if @counter.nil?
  		@counter =0
  	end
  	@counter+=1
  	#Product.all().order(:title) gives same results
  end
end
