module StoreIndexVisitsCounter
	extend ActiveSupport::Concern
	private	
		def increment_visits_counter
			if session[:visits_counter].nil?
				session[:visits_counter]=0;
			end
			session[:visits_counter]+=1
			@visits_counter = session[:visits_counter]
		end
end
	
	